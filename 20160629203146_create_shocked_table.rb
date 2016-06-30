class CreateShockedTable < ActiveRecord::Migration
  def change
    create_table :users do |table|
      table.string :username
      table.string :password
    end
  end
<<<<<<< HEAD
end
=======
end
>>>>>>> 862f71ec69c95862708ff66c672e068e95eb8291
