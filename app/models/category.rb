class Category < ActiveRecord::Base
  validates :name, presence: true, length: { in: 3..30 }

  belongs_to :user
  has_many :moneyrecords

end
