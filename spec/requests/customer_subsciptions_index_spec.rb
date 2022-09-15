require 'rails_helper'

RSpec.describe 'Customer Subscriptions Endpoint' do

    before :each do
        @customer1 = Customer.create!(first_name: 'Jack', last_name: 'Ryan', 
                    email: 'Jackry@gmail.com', address: '1146 Stevens St')
        @tea1 = Tea.create!(title: 'Green Tea', description: 'Earthy', temperature: 155, brew_time: 120)
        @subscription1 = @tea1.subscriptions.create!(title: 'The High Life', price: 25.00,
                 status: 'active', frequency: 'Once a week', tea_id: @tea1.id, customer_id: @customer1.id)
        @subscription2 = @tea1.subscriptions.create!(title: 'Quiet Life', price: 22.50,
                 status: 'cancelled', frequency: 'Three time a month', tea_id: @tea1.id, customer_id: @customer1.id)
        @subscription3 = @tea1.subscriptions.create!(title: 'Snooze', price: 35.00,
                 status: 'cancelled', frequency: 'Once a month', tea_id: @tea1.id, customer_id: @customer1.id)
        @subscription4 = @tea1.subscriptions.create!(title: 'Quiet Life', price: 30.50,
                 status: 'active', frequency: 'Twice time a month', tea_id: @tea1.id, customer_id: @customer1.id)
    end

    it 'exposes all of a customers subscriptions' do

        params = {
            customer_id: @customer1.id
            }

        post '/customer_subscriptions', params:params
        
        expect(response.status).to eq 200
        reply = JSON.parse(response.body, symbolize_names: true)
        expect(reply[:data]).to be_a Hash
        expect(reply[:data][:customer_id]).to eq @customer1.id
        expect(reply[:data][:subscriptions]).to be_a Hash
        expect(reply[:data][:subscriptions][:active]).to be_a Array
        expect(reply[:data][:subscriptions][:active].first[:title]).to eq 'The High Life'
        expect(reply[:data][:subscriptions][:cancelled]).to be_a Array
        expect(reply[:data][:subscriptions][:cancelled].first[:title]).to eq 'Quiet Life'
    end

    describe 'Sad Path' do

         it 'exposes all of a customers subscriptions' do

        params = {
            customer_id: 1000000000000
            }

        post '/customer_subscriptions', params:params
        
        expect(response.status).to eq 400
        reply = JSON.parse(response.body, symbolize_names: true)
        expect(reply[:error]).to eq 'Unknown Customer ID.'
    end


    end
end