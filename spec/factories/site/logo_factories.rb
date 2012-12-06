FactoryGirl.define do
  factory :site_logo, :class => 'Site::Logo' do
    attachment File.open(File.join(::Rails.root, 'spec/files', 'site/logo', 'attachment.jpg'))
  end
end
