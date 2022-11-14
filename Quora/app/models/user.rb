class User < ApplicationRecord

    # Assosiation Part
       has_many :posts , dependent:  :destroy
       has_many :comments, through: :posts

    # Validation Part
       validates :first_name,:last_name, presence: true
       validates :email, presence: true,format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: {case_sensitive: false}           
       validates :password, length: { minimum: 8 }
      
    
    # scope
    
end
