FactoryGirl.define do
  factory :post do
    sequence(:title) { |i| "Post ##{i}" }
    body 'This is the post body'

    factory :post_with_images do
      images { |post| FactoryGirl.create_list(:post_image, 5) }
    end
  end
end

