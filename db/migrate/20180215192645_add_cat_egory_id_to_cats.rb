class AddCatEgoryIdToCats < ActiveRecord::Migration[5.1]
  def change
    add_column :cats, :cat_egory_id, :integer
  end
end
