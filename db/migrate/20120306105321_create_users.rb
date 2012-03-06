class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :name
      t.string :email
      t.text :address
      t.string :phone_number
      t.string :group

      t.timestamps
    end
  end
end
