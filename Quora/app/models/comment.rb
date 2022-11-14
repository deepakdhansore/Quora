class Comment < ApplicationRecord
    
    # Assosiation Part
      belongs_to :post
      has_many :sub_comments, class_name: 'Comment',
                            foreign_key: 'replay_id'
    
      belongs_to :replay, class_name: 'Comment', optional: true
    
    # Validation Part
      
      validates :author , presence: true
    
    # call backs
      
       before_create do 
        puts post.valid?    
       end
     
end

#1 .Get specific post whose comment lies between specific date
#Ans1 => Post.last.comments.where(created_at:(Time.now-1.day)..Time.now +1.day)

#2 .Get count of all replies of posts that lie between specific date
#Ans2 => Post.second.comments.first.sub_comments.where(created_at: (Time.now.midnight-1.day)..Time.now.midnight+ 2.day).count


#3 .Fetch posts that did not have comments
#Ans3 => Post.includes(:comments).where(comments: {id: nil})

#4 .Fetch posts those who have more than 5 replies
#Ans => Post.joins(:comments).group(:id).having('count(comments.replay_id) > 5')

#5 .Searching posts by any text in the body field
#Ans => Post.where("body LIKE '%jchxcvh%' ")

