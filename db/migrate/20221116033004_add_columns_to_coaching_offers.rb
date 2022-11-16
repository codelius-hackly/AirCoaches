class AddColumnsToCoachingOffers < ActiveRecord::Migration[7.0]
  def change
    add_column :coaching_offers, :title, :string
    add_column :coaching_offers, :rating, :integer
  end
end
