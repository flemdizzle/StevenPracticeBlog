class Post < ActiveRecord::Base
   validates :title, presence: :true
   validates :body, presence: :truerails 

   def front_page
      pub = Post.where("draft = 'false'").last(10).reverse
   end

   def draft_page
      Post.where("draft = true").reverse
   end   
end
