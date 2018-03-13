Rails.application.routes.draw do

  resources :billing_cycles do
    resources :credits
    resources :debts
    get '/summary' => 'billing_cycles#summary', as: 'summary'
  end

  get '/count_billings' => 'billing_cycles#count', as: 'count'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
