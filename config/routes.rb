Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    
  post 'customer_subscriptions', to: 'customers_subscriptions#create'

  post 'customer_subscriptions_cancel', to: 'customers_subscriptions#cancel'

end
