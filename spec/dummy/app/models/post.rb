class Post < ActiveRecord::Base
  # associations
  has_one :video, :as => :assetable,
                  :class_name => "Post::Video",
                  :dependent => :destroy,
                  :inverse_of => :assetable
  has_many :images, :as => :assetable,
                    :class_name => "Post::Image",
                    :dependent => :destroy

  # attributes
  attr_accessible :body,
                  :title,
                  :images_attributes,
                  :video_attributes
  accepts_nested_attributes_for :images, :allow_destroy => true
  accepts_nested_attributes_for :video, :allow_destroy => true

  # callbacks
  # after_initialize :set_defaults

  # validations
  validates :title, :presence => true,
                    :uniqueness => true
  validates :body, :presence => true

  private

  def set_defaults
    build_video unless video
  end
end

