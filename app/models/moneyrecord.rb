class Moneyrecord < ActiveRecord::Base
  validates :name, presence: false
  validates :amount, :numericality => { only_integer: true, greater_than: 0 }
  validates :category_id, presence: true
  validate :made_at_future
  def made_at_future
    errors.add(:made_at, "the date can't be in the future") if
        !made_at.blank? and made_at > Date.today
  end

  belongs_to :category

  before_create :set_made_at_to_now
  def set_made_at_to_now
    self.made_at = Time.now
  end

end
