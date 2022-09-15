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

    def self.cancel_format(sub)
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

    def self.user_subs(cancelled, active, customer)
        {
            data: {
                customer_id: customer.id,
                subscriptions: {
                    active:                         
                        active.each do |sub|
                            {
                                title: sub.title,
                                price: sub.price,
                                status: sub.status,
                                frequency: sub.frequency,
                                tea_id: sub.tea_id
                            }
                        end,
                    cancelled:                         
                        cancelled.each do |sub|
                            {
                                title: sub.title,
                                price: sub.price,
                                status: sub.status,
                                frequency: sub.frequency,
                                tea_id: sub.tea_id
                            }
                        end
                    }

            }
        }

    end
end