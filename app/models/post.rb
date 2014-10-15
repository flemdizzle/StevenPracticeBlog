class Post < ActiveRecord::Base
   before_create :create_draft_first
   validates :title, presence: :true
   validates :body, presence: :truerails 

   def front_page
      pub = Post.where("draft = 'false'").last(10).reverse
   end

   def draft_page
      Post.where("draft = true").reverse
   end   

   def create_draft_first
      self.draft = true
   end
end
