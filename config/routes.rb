Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    
  post 'customer_subscriptions', to: 'customers_subscriptions#create'

end
