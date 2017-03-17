ActiveAdmin.register Tour do

  controller do
    def permitted_params
      tours = [ :name, :content, :image_url, :description, :slug, :important_info, :distance,:tuktuk_price,
                :checkpoint_num, :duration, :down_payment, :down_payment_currency, :booking_fee,
                :booking_fee_currency, :highlight_html, :include_html, :exclude_html, :tour_start, :tour_end,
                :card_img, :ticket_price_cents, :car_price,:is_active, :video_url, :length_id, tour_drivers_attributes: [:id, :driver_id, :_destroy], 
                images_attributes: [:id, :url, :alt_text, :is_hero, :_destroy], tour_activity_attributes: [:id, :activity_id, :_destroy] ]
      params.require(:tour).permit(tours)
    end

    def check_params_driver_attributes
      driver_attributes = []
      params[:tour][:tour_drivers_attributes].map {|tda| driver_attributes << tda[1]['driver_id']}
      # modifying nested_attributes(tour_drivers) when all_drivers scenario 
      if driver_attributes.flatten.include?('')
        params[:tour][:tour_drivers_attributes] = {}
        Driver.all.each_with_index do |driver,index|
          params[:tour][:tour_drivers_attributes][index.to_s] = {"driver_id"=> "#{driver.id}"}
        end
      end
    end

    def new
      @tour = Tour.new
      @tour.tour_drivers.build
    end
    
    def create
      drivers_array = []

      check_params_driver_attributes

      @tour = Tour.new(permitted_params)
      @tour.save
      redirect_to admin_tour_path(@tour)
    end

    def update
      driver_attributes = []
      params[:tour][:tour_drivers_attributes].map {|tda| driver_attributes << tda[1]['driver_id']}
      
      check_params_driver_attributes
      @tour = Tour.find(params[:id])
      if driver_attributes.flatten.include?('')
        @tour.tour_drivers.destroy_all
      end
      if @tour.update_attributes(permitted_params)
        redirect_to admin_tour_path(@tour.id)
      end
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

    # f.inputs 'Drivers' do
    #   f.has_many :tour_drivers, allow_destroy: true do |driver|
    #     driver.input :driver_id, label: 'Select Drivers', as: :select, collection: (Driver.all.map{|d| [d.full_name, d.id]}), prompt: 'All Drivers' 
    #   end
    # end

    # f.inputs 'length' do
    #   f.input :length_id, as: :select, collection: (Length.all.map{|l| [l.length_title, l.id]}), prompt: 'Choose length'
    # end

    # f.inputs 'Activities' do
    #   f.has_many :tour_activity, allow_destroy: true do |activity|
    #     activity.input :activity_id, label: 'Select Activities', as: :select, collection: (Activity.all.map{|a| [a.activity_name, a.id]}), prompt: 'Choose activities'
    #   end
    # end

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
