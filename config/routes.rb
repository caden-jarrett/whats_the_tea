Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    
  post 'create_subscriptions', to: 'subscriptions#create'

  post 'customer_subscriptions_cancel', to: 'subscriptions#cancel'
  
  post 'customer_subscriptions', to: 'subscriptions#all_subs'
end
