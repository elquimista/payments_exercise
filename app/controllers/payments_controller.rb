class PaymentsController < ApplicationController
  def show
    payment = Payment.find(params[:id])
    render json: payment
  end

  def index
    payments = Payment.where(loan_id: params[:loan_id])
    render json: payments
  end

  def create
    loan = Loan.find(params[:loan_id])
    payment = loan.payments.new(amount: params[:amount])
    
    if payment.save
      render json: {payment: payment}, status: :created
    else
      render json: payment.errors, status: :unprocessable_entity
    end
  end
end
