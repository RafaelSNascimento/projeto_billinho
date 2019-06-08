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
    # matriculations apí
    resources :matriculations
  end
end
