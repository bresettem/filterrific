class CreateTlds < ActiveRecord::Migration[5.0]
  def change
    create_table :tlds do |t|
      t.string :name, index: { unique: true }
      t.string :typ

      t.timestamps
    end
  end
end
