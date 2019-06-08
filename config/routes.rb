Rails.application.routes.draw do
  namespace "api" do
    # students api
    resources :students do
      # matriculations per students api
      resources :matriculations
    end
    # institutions api
    resources :institutions do
      # matriculations per students api
      resources :matriculations
    end
    # matriculations api
    resources :matriculations do
      resources :invoices
    end

    # matriculations api
    resources :invoices
  end
end
