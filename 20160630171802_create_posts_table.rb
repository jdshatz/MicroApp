class CreatePostsTable < ActiveRecord::Migration
  def change
  create_table :posts do |table|
      table.string :text
      table.string :title
    end
  end
end