Rails.application.routes.draw do
  defaults format: :json do
    resources :loans do
      resources :payments, only: [:create, :show, :index]
    end
  end
end
