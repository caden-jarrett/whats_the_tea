class CustomersSubscriptionsController < ApplicationController

    def create
        customer_sub = CustomersSubscriptions.new(customer_id: params[:user_id], subscription_id: params[:subscription_id])
        if customer_sub
            render json: CustomerSubscriptionSerializer.creation_format(customer_sub)
        else 
            render json: {error: 'Subscription was made incorrectly'}, status: 400
        end
    end
end