require 'spec_helper'

describe Post do
  context 'associations' do
    it { should have_many :images }
    it { should have_one :video }
  end

  context 'images' do
    it 'should count correctly' do
      post = FactoryGirl.create :post_with_images
      post.images.count.should eq(5)
    end
  end

  context 'validations' do
    it { should validate_presence_of :title }
    it { should validate_uniqueness_of :title }
    it { should validate_presence_of :body }
  end
end
