class Site < ActiveRecord::Base
  # associations
  has_one :logo, :as => :assetable,
                 :class_name => "Site::Logo",
                 :dependent => :destroy

  # attributes
  attr_accessible :logo_attributes,
                  :name
  accepts_nested_attributes_for :logo, :allow_destroy => true

  # validations
  validates :name, :presence => true
end
