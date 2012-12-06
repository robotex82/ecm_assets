FactoryGirl.define do
  factory :post_image, :class => 'Post::Image' do
    attachment File.open(File.join(::Rails.root, 'spec/files', 'post/image', 'attachment.jpg'))
  end
end
