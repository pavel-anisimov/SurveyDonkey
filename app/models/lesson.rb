class Lesson < ActiveRecord::Base
  belongs_to :user
  has_many   :responds
  attr_accessible :body, :instructor, :date, :solved

  validates :body, presence: true, length: { in: 10..512 }
  validates :instructor, presence: true, length: { in: 5..32 }
  validates :date, presence: true
  validates :solved, inclusion: { in: [true, false] }

  def self.unsolved(params)
    where(solved: false).paginate(page: params[:page], order: 'date DESC', per_page: 10)
  end

  def self.solved(params)
    where(solved: true).paginate(page: params[:page], order: 'date DESC', per_page: 10)
  end

  def self.search(params)
    where("body LIKE ?", "%#{params[:keyword]}%").paginate(page: params[:page], order: 'date DESC', per_page: 5)
  end
end
