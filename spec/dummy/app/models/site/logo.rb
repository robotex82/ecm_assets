class Site::Logo < ::Ecm::Assets::Asset
  # database settings
  self.table_name = 'ecm_assets_assets'

  # paperclip
  has_attached_file :attachment, :styles => { :default => "64x64>" }

  # validations
  validates_attachment_presence :attachment
end

