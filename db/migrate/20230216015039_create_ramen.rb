class CreateRamen < ActiveRecord::Migration[6.1]
  def change
    create_table :ramen do |t|
       t.integer :user_id
       t.string :genre
       t.string :name
       t.text :introduction
       t.text :address


      t.timestamps


    end
  end
end
