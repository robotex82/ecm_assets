module Ecm::Assets
  class PlainFile < Asset
    # database settings
    self.table_name = 'ecm_assets_assets'

    # paperclip
    has_attached_file :attachment

    # validations
    validates_attachment_presence :attachment
  end
end

