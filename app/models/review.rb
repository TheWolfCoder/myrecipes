class Review < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :chef
  
   validates :chef_id, presence: true
   validates :recipe_id, presence: true
   validates :title, presence: true, length: { minimum: 5, maximum: 40 }
   validates :review_text, presence: true, length: {minimum: 20, maximum: 700}

  
end