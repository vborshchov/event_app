class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :skype
      t.string :site
      t.text :about

      t.timestamps null: false
    end
  end
end
