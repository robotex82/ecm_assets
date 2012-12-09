class Download < ActiveRecord::Base
  # associations
  has_one :plain_file, :as => :assetable,
                       :class_name => "::Ecm::Assets::PlainFile",
                       :dependent => :destroy,
                       :inverse_of => :assetable

  # attributes
  attr_accessible :description,
                  :name,
                  :plain_file,
                  :plain_file_attributes
  accepts_nested_attributes_for :plain_file, :allow_destroy => true

  # validations
  validates :name, :presence => true,
                   :uniqueness => true
  validates :plain_file, :presence => true
end
