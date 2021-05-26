require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do
  describe '#index' do
    let(:loan) { Loan.create!(funded_amount: 100.0) }
    it 'responds with a 200' do
      get :index, params: {loan_id: loan.id}
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#show' do
    let(:loan) { Loan.create!(funded_amount: 100.0) }
    let(:payment) { Payment.create!(amount: 10.0, loan_id: loan.id) }

    it 'responds with a 200' do
      get :show, params: { id: payment.id, loan_id: loan.id }
      expect(response).to have_http_status(:ok)
    end
  end
  
  describe '#create' do
    let(:loan) { Loan.create!(funded_amount: 100.0) }

    it 'responds with amount error' do
      post :create, params: { amount: 150, loan_id: loan.id }
      expect(JSON.parse(response.body).fetch("amount").first).to eq("can't be greater than outstanding balance")
    end
  end
end
