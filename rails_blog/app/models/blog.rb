class Blog < ActiveRecord::Base
  belongs_to :user
  has_many :posts

  validates :name, :user_id, uniqueness: { case_sensitive: false }
  validates :name, :description, presence: true

end
