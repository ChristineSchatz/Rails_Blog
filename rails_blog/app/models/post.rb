class Post < ActiveRecord::Base
  belongs_to :blog

  validates :title, :body, presence: true

end
