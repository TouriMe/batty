ActiveAdmin.register Tour do

  controller do
    def permitted_params
      tours = [ :name, :content, :image_url, :description, :slug, :important_info, :distance,
                :checkpoint_num, :duration, :down_payment, :down_payment_currency, :booking_fee,
                :booking_fee_currency, :highlight_html, :include_html, :exclude_html, :tour_start, :tour_end,
                :card_img, :is_active, :video_url, tour_drivers_attributes: [:id, :driver_id, :_destroy], 
                images_attributes: [:id, :url, :alt_text, :is_hero, :_destroy] ]
      params.require(:tour).permit(tours)
    end

    def new
      @tour = Tour.new
      @tour.tour_drivers.build
    end
    
    def create
      p = params[:tour]

      drivers_array = []

      @tour = Tour.new(permitted_params)
      if @tour.save
        p["tour_drivers_attributes"].map { |td| drivers_array << td[1]['driver_id']}

        if drivers_array.include?("")
          Driver.all.each do |d|
            TourDriver.create(tour_id: @tour.id,driver_id: d.id)
          end
        else
          drivers_array.each do |d|
            TourDriver.create(tour_id: @tour.id,driver_id: d)
          end
        end
        redirect_to admin_tour_path(@tour)
      else
        render :new
      end
    end

    def update
      p = params[:tour] 

      drivers_array = []
      element_of_drivers = []

      tour = Tour.find(params[:id])
      @tour = tour.update_attributes(permitted_params)
      tourdriver_ids = tour.tour_drivers.pluck(:id)

      p["tour_drivers_attributes"].map { |td| drivers_array << td[1].values}

      if drivers_array.flatten.include?("")
        tour.tour_drivers.destroy_all
        Driver.all.each do |d|
          TourDriver.create(tour_id: tour.id,driver_id: d.id)
        end
      else
        tourdriver_index = 0
        drivers_array.each do |d|
          # binding.pry
          if d.length == 1
            TourDriver.create(tour_id: tour.id,driver_id: d[0])
          else
            if d[1] != '1'
              # error delete then add 
              # error update then add
              # delete then update is fine
              tourdriver_id = TourDriver.find(tourdriver_ids[tourdriver_index])
              tourdriver_id.update_attributes(tour_id: tour.id, driver_id: d[0])
              tourdriver_index += 1
            end
          end
        end
      end
      
      redirect_to admin_tour_path(tour.id)
    end
  end

  

  form do |f|
    f.inputs do
      input :name
      input :description
      input :is_active, label: 'Is this an active tour?'
      input :distance, hint: 'integer, unit is `km`'
      input :duration, hint: 'integer, for example: 4 hrs'
      input :checkpoint_num, hint: 'integer, number of checkpoints'
      input :content, as: :ckeditor
      input :important_info, as: :ckeditor
      input :highlight_html, as: :ckeditor
      input :include_html, as: :ckeditor
      input :exclude_html, as: :ckeditor
      input :tour_start
      input :tour_end
    end

    f.inputs 'Drivers' do
      f.has_many :tour_drivers, allow_destroy: true do |driver|
        driver.input :driver_id, label: 'Select Drivers', as: :select, collection: (Driver.all.map{|d| [d.full_name, d.id]}), prompt: 'All Drivers' 
      end
    end

    f.inputs 'Price Calculation' do
      input :tuktuk_price
      input :car_price
      input :ticket_price_cents, label:'Ticket Price'
      # input :down_payment, label: 'Online Payment Rate', hint: 'decimal number(%), Eg: 30'
      input :ticket_price_currency, label: 'Settlement Currency', hint: 'By Default: USD'
    end

    f.inputs 'Media' do
      f.input :video_url, label: 'Video URL'
      f.input :card_img, :as => :file, label: 'Card Image ( Image Size Should be 800* 500 )', :hint => f.tour.card_img.url.present? \
        ? image_tag(f.tour.card_img.url, class: 'active_admin_img')
      : content_tag(:span, 'No Card Image Yet')

      f.inputs 'Photo Gallery' do
        f.has_many :images, allow_destroy: true do |i|
          i.input :url, as: :file, label: 'Gallery Image', :hint => i.object.url.present? \
          ? image_tag(i.object.url, class: 'active_admin_img')
          : content_tag(:span, 'No Image Was Uploaded')
          i.input :alt_text
          i.input :is_hero, hint: 'Each tour can have at most one Hero Image'
        end
      end
    end

    f.actions
  end

  index :title => 'Tours' do
    selectable_column
    column :name
    column(:tuktuk_price) { |c| c.tuktuk_price.to_s + ' ' + c.tuktuk_price.currency }
    column(:car_price) { |c| c.car_price.to_s + ' ' + c.car_price.currency }
    column :booking_fee
    column :duration
    column :checkpoints_num
    column :distance
    column :updated_at
    column :is_active
    actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row(:tuktuk_price) { tour.tuktuk_price.to_s + ' ' + tour.tuktuk_price.currency }
      row(:car_price) { tour.car_price.to_s + ' ' + tour.car_price.currency }
      row :content
      row(:images) { tour.images.map(&:url).join ' ,' }
    end
    active_admin_comments
  end
end
