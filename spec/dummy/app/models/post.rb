class Post < ActiveRecord::Base
  # associations
  has_one :video, :as => :assetable,
                  :class_name => "Post::Video",
                  :dependent => :destroy
  has_many :images, :as => :assetable,
                    :class_name => "Post::Image",
                    :dependent => :destroy

  # attributes
  attr_accessible :body,
                  :title

  # validations
  validates :title, :presence => true,
                    :uniqueness => true
  validates :body, :presence => true
end

