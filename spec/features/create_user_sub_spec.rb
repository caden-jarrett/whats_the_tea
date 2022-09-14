require 'rails_helper'

RSpec.describe "Customer Subscription Creation", type: :request do
    before :each do
        @customer1 = Customer.create!(first_name: 'Jack', last_name: 'Ryan', 
                    email: 'Jackry@gmail.com', address: '1146 Stevens St')
        @tea1 = Tea.create!(title: 'Green Tea', description: 'Earthy', temperature: 155, brew_time: 120)
    end

    it 'exposes a post route to create a user subscription' do


        params = {
            customer_id: @customer1.id,
            tea_id: @tea1.id,
            title: 'The High Life',
            frequency: 'Twice a week',
            price: 25.50
            }

        post '/customer_subscriptions', params:params
        
        expect(response.status).to eq 200


        reply = JSON.parse(response.body, symbolize_names: true)
        
        expect(reply[:data]).to be_a Hash
        expect(reply[:data][:customer_id]).to be_a Integer
        expect(reply[:data][:tea_id]).to be_a Integer
        expect(reply[:data][:status]).to eq 'active'
        expect(reply[:data][:price]).to eq 25.50
        expect(reply[:data][:frequency]).to eq 'Twice a week'
    end

    describe 'Sad Path' do

        it 'renders a error message about a unknown customer if the ID cant be found in our database' do

            params = {
                user_id: 100000000,
                tea_id: @tea1.id
                }

            post '/customer_subscriptions', params:params

            expect(response.status).to eq 400

            reply = JSON.parse(response.body, symbolize_names: true)

            expect(reply[:error]).to eq 'Subscription was made with unknown Customer.'
        end

        it 'renders a error message about a unknown tea if the ID cant be found in our database' do

            params = {
                user_id: @customer1,
                subscription_id: 100000000000
                }

            post '/customer_subscriptions', params:params

            expect(response.status).to eq 400

            reply = JSON.parse(response.body, symbolize_names: true)

            expect(reply[:error]).to eq 'Subscription was made with unknown Tea.'
        end
    end
end
