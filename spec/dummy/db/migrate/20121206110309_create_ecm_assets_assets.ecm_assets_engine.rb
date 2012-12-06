# This migration comes from ecm_assets_engine (originally 1)
class CreateEcmAssetsAssets < ActiveRecord::Migration
  def change
    create_table :ecm_assets_assets do |t|
      # sti
      t.string :type

      # associations
      t.integer :assetable_id
      t.string :assetable_type

      # paperclip
      t.string :attachment_file_name
      t.string :attachment_content_type
      t.integer :attachment_file_size
      t.timestamp :attachment_updated_at

      t.timestamps
    end
  end
end
