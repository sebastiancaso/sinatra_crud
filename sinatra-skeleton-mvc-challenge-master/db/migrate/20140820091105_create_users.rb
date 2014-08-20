class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :address, :phone_number, :email, :password_digest
      t.timestamps
    end
  end
end
