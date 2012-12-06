class Site < ActiveRecord::Base
  # associations
  has_one :logo, :as => :assetable,
                 :class_name => "Site::Logo",
                 :dependent => :destroy

  # attributes
  attr_accessible :name
  accepts_nested_attributes_for :logo

  # validations
  validates :name, :presence => true
end
