class Moneyrecord < ActiveRecord::Base
  validates :name, presence: true, length: { in: 3..30 }
  validate :created_at_future

  belongs_to :category

  def created_at_future
    errors.add(:created_at, "the date can't be in the future") if
        !created_at.blank? and created_at > Date.today
  end
end
