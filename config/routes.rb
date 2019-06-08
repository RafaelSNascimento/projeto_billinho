Rails.application.routes.draw do
  namespace 'api' do
    resources :students
    resources :institutions
  end
end
