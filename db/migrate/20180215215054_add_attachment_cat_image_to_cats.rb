class AddAttachmentCatImageToCats < ActiveRecord::Migration[5.1]
  def self.up
    change_table :cats do |t|
      t.attachment :cat_image
    end
  end

  def self.down
    remove_attachment :cats, :cat_image
  end
end
