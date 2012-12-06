FactoryGirl.define do
  factory :download do
    sequence(:name) { |i| "Download ##{i}" }
    association :plain_file, :factory => :ecm_assets_plain_file
    # attachment File.open(File.join(::Rails.root, 'spec/files', 'plain_file', 'attachment.jpg'))
  end
end
