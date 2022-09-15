require 'rails_helper'

RSpec.describe Tea do
    describe 'exists and has attributes' do
        it { validate_presence_of :title }
        it { validate_presence_of :description }
        it { validate_presence_of :temperature }
        it { validate_presence_of :brew_time }
    end

    describe 'exists and has relationships' do
        it { should have_many(:subscriptions) } 
    end
end