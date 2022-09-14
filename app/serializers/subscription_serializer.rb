class SubscriptionSerializer
    def self.creation_format(sub)
        {
            data: {
                customer_id: sub.customer_id,
                tea_id: sub.tea_id,
                status: sub.status,
                price: sub.price,
                frequency: sub.frequency
            }
        }
    end
end