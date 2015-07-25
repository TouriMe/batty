ActiveAdmin.register Driver do
  form do |f|
    f.inputs 'Particulars' do
      f.input :first_name
      f.input :last_name

      f.input :nickname
      f.input :short_desc
      f.input :description, as: :text
    end

    f.inputs 'Contacts' do
      f.input :phone
      f.input :email
      f.input :wechat_id
      f.input :whatsapp_id
      f.input :facebook_url
    end

    f.inputs 'Intro' do
      f.input :avatar_url
      f.input :video_url
    end

    f.inputs "Language" do
      f.has_many :languages, allow_destroy: true, new_record: true do |l|
        l.input :language_code, as: :select, collection: LanguageList::COMMON_LANGUAGES.map{|l| [l.name, l.iso_639_3]}
        l.input :proficiency, as: :select, collection: DriverLanguage.proficiencies
      end
    end

    f.actions
  end
end
