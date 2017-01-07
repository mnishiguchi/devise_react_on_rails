class CreatePropertyClients < ActiveRecord::Migration[5.0]
  def change
    create_table :property_clients do |t|
      t.string  :name
      t.references :account_executive,  index: true
      t.timestamps
    end
  end
end
