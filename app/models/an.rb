class An < ApplicationRecord
  belongs_to :question
  validates :body, presence: true, length: {minimum: 5}

  def formattedDate
    self.created_at.strftime('%H:%M:%S %d-%m-%Y')
  end
end
