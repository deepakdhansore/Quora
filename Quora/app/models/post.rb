class Post < ApplicationRecord
  
    # Assosiation Part
        
        belongs_to :user 
        has_many :comments, dependent:  :destroy
        
    # Validation Part

        validates :author, :body, presence: true
     
    # scopes
      
        scope :published, -> { where('published_at < ?',Time.now) }

        scope :recent,-> (x){ order('id desc').limit(x) }

    # call backs

        before_create do
               puts Post.column_names
            
        end

        after_create do
        
            puts self.author
        end

       
end
