class CreateProfileTable < ActiveRecord::Migration
  def change
  	    create_table :profile do |table|
      table.string :fname
      table.string :lname
      tabble.string :location
      table.string :bio
      table.timestamps
  	end
  end
end