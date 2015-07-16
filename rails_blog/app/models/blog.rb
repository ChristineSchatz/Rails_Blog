class Blog < ActiveRecord::Base
  belongs_to :user
  has_many :posts, dependent: :destroy

  validates :name, uniqueness: { case_sensitive: false }
  validates :name, :description, presence: true

end
