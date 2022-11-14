class CreateCoachingOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :coaching_offers do |t|
      t.text :description
      t.integer :price
      t.string :skill
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
