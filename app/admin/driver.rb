ActiveAdmin.register Driver do
  particulars = {first_name:nil, last_name: nil, nickname: nil, short_desc: nil, description: :text}
  contacts = {phone:nil, email:nil, wechat_id: nil, whatsapp_id: nil, facebook_url: nil }
  intros  = {avatar_url: nil, video_url: nil }

  permit_params *(particulars.keys + contacts.keys + intros.keys), languages_attributes: [:language_code, :proficiency]

  register_fields = Proc.new do |f, fields|
    fields.each do |field, type|
      if type
        f.input field, as: type
      else
        f.input field
      end
    end
  end

  form do |f|
    f.inputs('Particulars'){ register_fields[f, particulars] }
    f.inputs('Contacts'){ register_fields[f, contacts]}
    f.inputs('Intro'){ register_fields[f, intros]}

    f.inputs 'Language' do
      f.has_many :languages, allow_destroy: true, new_record: true do |l|
        l.input :language_code, as: :select, collection: LanguageList::COMMON_LANGUAGES.map{|l| [l.name, l.iso_639_3]}
        l.input :proficiency, as: :select, collection: DriverLanguage.proficiencies.keys.to_a
      end
    end

    f.actions
  end
end
