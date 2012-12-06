FactoryGirl.define do
  factory :post_video, :class => 'Post::Video' do
    attachment File.open(File.join(::Rails.root, 'spec/files', 'post/video', 'attachment.flv'))
  end
end
