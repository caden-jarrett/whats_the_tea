class AddStatusToCustomersSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :customers_subscriptions, :active, :boolean
  end
end
