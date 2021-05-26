class Payment < ActiveRecord::Base
  belongs_to :loan
  
  validates :amount, presence: true
  validate :amount_cannot_be_greater_than_outstanding_balance

  def amount_cannot_be_greater_than_outstanding_balance
    if amount > loan.get_outstanding_balance
      errors.add(:amount, "can't be greater than outstanding balance")
    end
  end
end
