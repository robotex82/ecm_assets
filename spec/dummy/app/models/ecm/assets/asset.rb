class Ecm::Assets::Asset < ActiveRecord::Base
  # model settings
  self.abstract_class = true

  # associations
  belongs_to :assetable, :polymorphic => true
  delegate :url, :to => :attachment

  # attributes
  attr_accessible :assetable_id,
                  :assetable_type,
                  :attachment,
#                  :attachment_content_type,
#                  :attachment_file_name,
#                  :attachment_file_size,
#                  :attachment_updated_at,
                  :type
end

