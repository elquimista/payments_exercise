class Loan < ActiveRecord::Base
  has_many :payments

  attribute :outstanding_balance, :float

  def calculate_outstanding_balance
    self["outstanding_balance"] = funded_amount - payments.sum(:amount)
  end
end
