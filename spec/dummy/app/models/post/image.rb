class Post::Image < ::Ecm::Assets::Asset
  # database settings
  self.table_name = 'ecm_assets_assets'

  # paperclip
  has_attached_file :attachment, :styles => { :small => "200x150>",
                                              :large => "400x300>" }

  # validations
  validates_attachment_presence :attachment
end

