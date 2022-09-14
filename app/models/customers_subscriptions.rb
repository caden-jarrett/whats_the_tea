class CustomersSubscriptions < ApplicationRecord
    belongs_to :customers, optional: true
    belongs_to :subscriptions, optional: true

end
