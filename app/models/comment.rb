class Comment < ActiveRecord::Base
   belongs_to :post, dependent: :destroy
   validates :name, presence: :true
   validates :comment, presence: :true

end
