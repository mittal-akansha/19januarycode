class AddViewToUserPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :user_posts, :view, :integer,default:0
  end
end
