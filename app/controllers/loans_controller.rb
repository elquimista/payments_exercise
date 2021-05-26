class LoansController < ActionController::API

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: 'not_found', status: :not_found
  end

  def index
    loans = Loan.all.map(&:get_outstanding_balance)
    render json: loans
  end

  def show
    loan = Loan.find(params[:id])
    loan.get_outstanding_balance
    render json: loan
  end

end
