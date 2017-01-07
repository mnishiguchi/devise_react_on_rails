class CreateAccountExecutives < ActiveRecord::Migration[5.0]
  def change
    create_table :account_executives do |t|
      t.string :name
      t.timestamps
    end
  end
end
