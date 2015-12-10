ActiveAdmin.register Trip do
  controller do
    def permitted_params
      params.permit!
    end
  end

  form do |f|
    f.inputs do
      input :name
      input :description
      input :tuktuk_price
      input :car_price
      input :image_url, hint: 'The image shown as the background when listing trips'
      input :distance, hint: 'integer, unit is `km`'
      input :duration, hint: 'text, for example: 4 days'
      input :checkpoint_num, hint: 'integer, number of checkpoints'
      input :down_payment, hint: 'Can use decimal number'
      input :down_payment_currency, hint: 'By Default: USD'
      input :booking_fee
      input :booking_fee_currency
      input :content, as: :html_editor
      input :important_info, as: :html_editor
    end

    f.inputs 'Images' do
      f.has_many :images, allow_destroy: true do |i|
        i.input :url
        i.input :alt_text
      end
    end

    f. actions
  end

  index do
    selectable_column
    column :name
    column(:tuktuk_price){|c| c.tuktuk_price.to_s + ' ' + c.tuktuk_price.currency}
    column(:car_price){|c| c.car_price.to_s + ' ' + c.car_price.currency}
    column :down_payment 
    column :booking_fee
    column :duration
    column :checkpoints_num
    column :distance
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row(:tuktuk_price){ trip.tuktuk_price.to_s + ' ' + trip.tuktuk_price.currency}
      row(:car_price){trip.car_price.to_s + ' ' + trip.car_price.currency}
      row :content
      row(:images){ trip.images.map(&:url).join ' ,'}
    end
    active_admin_comments
  end
end
