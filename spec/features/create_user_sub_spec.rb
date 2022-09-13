require 'rails_helper'

RSpec.describe "Customer Subscription Creation", type: :request do
    before :each do
        @customer1 = Customer.create!(first_name: 'Jack', last_name: 'Ryan', 
                    email: 'Jackry@gmail.com', address: '1146 Stevens St')
        @tea1 = Tea.create!(title: 'Green Tea', description: 'Earthy', temperature: 155, brew_time: 120)
        @subscription1 = @tea1.subscriptions.create!(title: 'The High Life', price: 25.00,
                 status: 'active', frequency: 'Once a week')
    end

    it 'exposes a post route to create a user subscription' do


        params = {
            user_id: @customer1.id,
            subscription_id: @subscription1.id
            }

        post '/customer_subscriptions', params:params
        
        expect(response).to be_successful

        reply = JSON.parse(response.body, symbolize_names: true)
        
        expect(reply[:data]).to be_a Hash
        expect(reply[:data][:customer_id]).to be_a Integer
        expect(reply[:data][:subscription_id]).to be_a Integer
        expect(reply[:data][:active]).to eq true
    end
end
