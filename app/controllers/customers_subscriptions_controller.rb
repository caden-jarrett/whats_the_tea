class CustomersSubscriptionsController < ApplicationController

    def create 
        customer = Customer.find_by(id: params[:customer_id])
        tea = Tea.find_by(id: params[:tea_id])
        if tea == nil
            render json: {error: 'Subscription was made with unknown Tea.'}, status: 400
        elsif customer ==  nil
            render json: {error: 'Subscription was made with unknown Customer.'}, status: 400
        else 
            customer_sub = Subscription.new(customer_id: params[:customer_id], 
                tea_id: params[:tea_id], title: params[:title],
                status: 'active', price: params[:price], frequency: params[:frequency])
            customer_sub.save
            render json: SubscriptionSerializer.creation_format(customer_sub)
        end
    end

    def cancel
        check = Subscription.find_by(id: params["subscription_id"].to_i) 
        if check 
            sub = Subscription.find(params["subscription_id"].to_i)
            sub.status = 'cancelled'
            sub.save
            render json: SubscriptionSerializer.cancel_format(sub)
        else sub ==  nil
            render json: {error: 'Unknown subscription.'}, status: 400
        end
    end
end