class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
   has_many :user_posts  
   has_many :comments    

   scope :all_except ,->(user){where.not(id: user)}
  #  after_create_commit {broadcast_append_to "users"}
   has_many :messages
end
