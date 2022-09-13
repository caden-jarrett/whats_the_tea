class CustomerSubscriptionSerializer
    def self.creation_format(sub)
        {
            data: {
                customer_id: sub.customer_id,
                subscription_id: sub.subscription_id
            }
        }
    end
end