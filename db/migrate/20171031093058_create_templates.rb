class CreateTemplates < ActiveRecord::Migration[5.0]
  def change
    create_table :templates do |t|
      t.string :title
      t.text :body
      t.boolean :active

      t.timestamps
    end
  end
end
