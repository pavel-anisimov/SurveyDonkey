class User < ActiveRecord::Base
  has_many :lessons
  has_many :responds
  attr_accessible :username, :platoon, :squad, :password, :password_confirmation

  has_secure_password

  validates :username, presence: true,
            uniqueness: { case_sensitive: false},
            length: { in: 3..20 },
            format: { with: /^[A-Za-z][A-Za-z0-9]*$/, message: 'Can contain only letters and numbers and has to start with a letter' }

  validates :platoon, presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 2 }

  validates :squad, presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 3 }

  validates :password, length: { in: 4..16 }
  validates :password_confirmation, length: { in: 4..16 }

  def your_lessons(params)
    lessons.paginate(page: params[:page], order: 'created_at DESC', per_page: 5)

  end
end
