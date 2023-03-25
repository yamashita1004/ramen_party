class CreateRamen < ActiveRecord::Migration[6.1]
  def change
    create_table :ramen do |t|
       t.integer :user_id
       t.string :genre, null: false
       t.string :name, null: false
       t.text :introduction, null: false
       t.text :address, null: false


      t.timestamps


    end
  end
end
