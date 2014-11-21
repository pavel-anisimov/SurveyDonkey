class Respond < ActiveRecord::Base
  belongs_to :user
  belongs_to :lesson
  attr_accessible :body
  attr_accessible :respond_type

  validates :body, presence: true, length: { in: 5..255 }

end
