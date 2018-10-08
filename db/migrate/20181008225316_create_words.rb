class CreateWords < ActiveRecord::Migration[5.0]
  def change
    create_table :words do |t|
      t.string :typ
      t.string :spacer
      t.jsonb :word, index: { unique: true }

      t.timestamps
    end
  end
end
