class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.boolean :admin
      t.string :email_address

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
