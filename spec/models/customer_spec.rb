require 'rails_helper'

RSpec.describe Customer do
    describe 'exists and has attributes' do
        it { validate_presence_of :first_name }
        it { validate_presence_of :last_name }
        it { validate_presence_of :email }
        it { validate_presence_of :address }
    end

    describe 'exists and has relationships' do
        it { should have_many(:subscriptions) } 
    end
end