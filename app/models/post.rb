class Post < ActiveRecord::Base
   has_many :comments
   before_create :create_draft_first
   validates :title, presence: :true
   validates :body, presence: :true
   scope :front_page, -> {order(:published_at).where("draft = 'false'").last(10).reverse}
   scope :draft_page, -> {where("draft = true").reverse}

   def create_draft_first
      self.draft = true
   end
end
