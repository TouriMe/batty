ActiveAdmin.register Driver do
  particulars = {first_name:nil, last_name: nil, nickname: nil, short_desc: nil, description: :text, is_active: nil}
  contacts = {phone:nil, email:nil, wechat_id: nil, whatsapp_id: nil, facebook_url: nil }
  intros  = {childsafe: nil, avatar_url: nil, video_url: nil, driving_years:nil}

  all_fields = particulars.keys + contacts.keys + intros.keys

  index do
    selectable_column
    column :first_name
    column :last_name
    column :phone
    column :email
    column :driving_years
    column :updated_at
    actions
  end

  permit_params *all_fields,
                languages_attributes: [:id, :_destroy, :language_code, :proficiency],
                driver_cities_attributes: [:id, :city_id, :_destroy],
                images_attributes: [:id, :url, :url_small, :alt_text, :_destroy],
                driver_vehicles_attributes: [:id, :vehicle_id, :_destroy]

  register_fields = Proc.new do |f, fields|
    fields.each do |field, type|
      puts "Register -> #{field}: #{type}"
      if type
        f.input field, as: type
      else
        f.input field
      end
    end
  end

  form do |f|
    f.inputs('Particulars') do
      register_fields[f, particulars]

      f.has_many :driver_cities, allow_destroy: true do |city|
        city.input :city_id, label: 'Name', as: :select, collection: (City.all.map {|c| [c.name, c.id]})
      end

      f.has_many :driver_vehicles, allow_destroy: true do |vehicle|
        vehicle.input :vehicle_id, label: 'Name', as: :select, collection: (Vehicle.all.map {|v| [v.name, v.id]})
      end
    end
    f.inputs('Contacts'){ register_fields[f, contacts]}
    f.inputs('Intro'){ register_fields[f, intros]}

    f.inputs 'Language' do
      f.has_many :languages, allow_destroy: true do |l|
        l.input :language_code, as: :select, collection: LanguageList::COMMON_LANGUAGES.map{|l| [l.name, l.iso_639_3]}
        l.input :proficiency, as: :select, collection: DriverLanguage.proficiencies.keys.to_a
      end
    end

    f.inputs 'Images' do
      f.has_many :images, allow_destroy: true do |i|
        i.input :url
        i.input :url_small
        i.input :alt_text
      end
    end

    f.actions
  end


  show do
    table_panel = Proc.new do |name, models, &blk|
      panel name do
        table do
          models.each do |m|
            tr do
              blk[m].each {|s| td s}
            end
          end
        end
      end
    end

    attributes_table do
      all_fields.each do |field|
        row field
      end

      row(:cities){ driver.cities.map(&:name).join ' ,'}
      row(:vehicles){ driver.vehicles.map(&:name).join ' ,'}
      row(:images){ driver.images.map(&:url).join ' ,'}
    end

    table_panel.call('Languages', driver.languages) do |l|
      [LanguageList::LanguageInfo.find(l.language_code).name, l.proficiency]
    end


    active_admin_comments
  end
end
