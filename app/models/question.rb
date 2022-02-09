class Question < ApplicationRecord
  has_many :ans
  validates :title, presence: true, length: {minimum: 5}
  validates :body, presence: true, length: {minimum: 15}

  def formattedDate
    self.created_at.strftime('%d-%m-%Y')
  end
end
