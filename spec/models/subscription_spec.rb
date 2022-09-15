require 'rails_helper'

RSpec.describe Subscription do
    describe 'exists and has attributes' do
        it { validate_presence_of :title }
        it { validate_presence_of :price }
        it { validate_presence_of :status }
        it { validate_presence_of :frequency }
        it { validate_presence_of :tea_id }
        it { validate_presence_of :customer_id }
    end

    describe 'relationships' do
        it { should belong_to(:customer) }
        it { should belong_to(:tea) }
    end
end