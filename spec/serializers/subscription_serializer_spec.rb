require 'rails_helper'

RSpec.describe 'SubscriptionSerializer' do



    it 'returns a JSON reply in hash formatting when creating a subscription' do
        customer1 = Customer.create!(first_name: 'Jack', last_name: 'Ryan', 
                    email: 'Jackry@gmail.com', address: '1146 Stevens St')
        tea1 = Tea.create!(title: 'Green Tea', description: 'Earthy', temperature: 155, brew_time: 120)
        subscription1 = tea1.subscriptions.create!(title: 'The High Life', price: 25.00,
                 status: 'active', frequency: 'Once a week', tea_id: tea1.id, customer_id: customer1.id)

        json = SubscriptionSerializer.creation_format(subscription1)

        expect(json).to be_a Hash
        expect(json[:data]).to be_a Hash
        expect(json[:data][:customer_id]).to be_a Integer
        expect(json[:data][:status]).to be_a String
        expect(json[:data][:price]).to be_a Float
        expect(json[:data][:frequency]).to be_a String
        expect(json[:data][:tea_id]).to be_a Integer
    end

    it 'returns a JSON reply in hash formatting when cancelling a subscription' do
        customer1 = Customer.create!(first_name: 'Jack', last_name: 'Ryan', 
                    email: 'Jackry@gmail.com', address: '1146 Stevens St')
        tea1 = Tea.create!(title: 'Green Tea', description: 'Earthy', temperature: 155, brew_time: 120)
        subscription1 = tea1.subscriptions.create!(title: 'The High Life', price: 25.00,
                 status: 'active', frequency: 'Once a week', tea_id: tea1.id, customer_id: customer1.id)

        json = SubscriptionSerializer.cancel_format(subscription1)

        expect(json).to be_a Hash
        expect(json[:data]).to be_a Hash
        expect(json[:data][:customer_id]).to be_a Integer
        expect(json[:data][:status]).to be_a String
        expect(json[:data][:price]).to be_a Float
        expect(json[:data][:frequency]).to be_a String
        expect(json[:data][:tea_id]).to be_a Integer
    end

end