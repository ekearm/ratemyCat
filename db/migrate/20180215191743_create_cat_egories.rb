class CreateCatEgories < ActiveRecord::Migration[5.1]
  def change
    create_table :cat_egories do |t|
      t.string :name

      t.timestamps
    end
  end
end
