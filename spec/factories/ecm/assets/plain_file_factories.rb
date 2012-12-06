FactoryGirl.define do
  factory :ecm_assets_plain_file, :class => 'Ecm::Assets::PlainFile' do
    attachment File.open(File.join(::Rails.root, 'spec/files', 'ecm/assets/plain_file', 'attachment.jpg'))
  end
end
