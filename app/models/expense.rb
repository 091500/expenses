class Expense < ActiveRecord::Base
  validates :name, presence: true, length: { in: 3..30 }
  belongs_to :user
end
