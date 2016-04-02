ActiveAdmin.register Tour do

  controller do
    def permitted_params
      params.permit!
    end
  end

  form do |f|
    f.inputs do
      input :name
      input :description
      input :is_active, label: 'Is This Tour Is Active?'
      input :distance, hint: 'integer, unit is `km`'
      input :duration, hint: 'text, for example: 4 days'
      input :checkpoint_num, hint: 'integer, number of checkpoints'
      input :content, as: :ckeditor
      input :important_info, as: :ckeditor
      input :highlight_html, as: :ckeditor
      input :include_html, as: :ckeditor
      input :exclude_html, as: :ckeditor
      input :tour_start
      input :tour_end
    end

    f.inputs 'Price Calculation' do
      input :tuktuk_price
      input :car_price

      input :down_payment, label: 'Online Payment Rate', hint: 'decimal number(%), Eg: 30'
      input :down_payment_currency, label: 'Settlement Currency', hint: 'By Default: USD'
    end

    f.inputs 'Media' do
      f.input :card_img, :as => :file, label: 'Card Image ( Image Size Should be 800* 500 )', :hint => f.tour.card_img.url.present? \
        ? image_tag(f.tour.card_img.url, class: 'active_admin_img')
        : content_tag(:span, 'No Card Image Yet')
      
      f.inputs 'Photo Gallery' do
      f.has_many :images, allow_destroy: true do |i|
        i.input :url, as: :file , label: 'Gallery Image', :hint => i.object.url.present? \
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
  column :down_payment
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
