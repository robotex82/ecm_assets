class Download < ActiveRecord::Base
  # associations
  has_one :plain_file, :as => :assetable, :class_name => "::Ecm::Assets::PlainFile", :dependent => :destroy

  # attributes
  attr_accessible :description,
                  :name

  # validations
  validates :name, :presence => true,
                   :uniqueness => true
  validates :plain_file, :presence => true
end
