class CreateDomains < ActiveRecord::Migration[5.0]
  def change
    create_table :domains do |t|
      t.boolean :available
      t.string :currency
      t.boolean :definitive
      t.string :domain
      t.integer :period
      t.integer :price, limit: 8
      t.integer :score
      t.string :spacer
      t.string :tld
      t.string :typ
      t.index %i[domain score], unique: true

      t.timestamps
    end
  end
end
