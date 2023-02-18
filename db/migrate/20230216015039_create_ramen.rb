class CreateRamen < ActiveRecord::Migration[6.1]
  def change
    create_table :ramen do |t|
       t.integer :user_id
       t.integer :genre_id
       t.string :name
       t.text :introduction
       t.integer :addresses
       
      
      t.timestamps
      
      
    end
  end
end
