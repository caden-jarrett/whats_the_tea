require 'rails_helper'

RSpec.describe "Customer Subscription Creation", type: :request do
    before :each do
        @customer1 = Customer.create!(first_name: 'Jack', last_name: 'Ryan', 
                    email: 'Jackry@gmail.com', address: '1146 Stevens St')
        @tea1 = Tea.create!(title: 'Green Tea', description: 'Earthy', temperature: 155, brew_time: 120)
        @subscription1 = @tea1.subscriptions.create!(title: 'The High Life', price: 25.00,
                 status: 'active', frequency: 'Once a week', tea_id: @tea1.id, customer_id: @customer1.id)
    end

    it 'exposes a post route to cancel a customer subscription' do

        params = {
            subscription_id: @subscription1.id
            }

        post '/customer_subscriptions_cancel', params:params
        
        expect(response.status).to eq 200
        expect(Subscription.first.status).to eq 'cancelled'
        reply = JSON.parse(response.body, symbolize_names: true)
        expect(reply[:data]).to be_a Hash
        expect(reply[:data][:customer_id]).to eq @customer1.id
        expect(reply[:data][:tea_id]).to eq @tea1.id
        expect(reply[:data][:status]).to eq 'cancelled'
    end
end