class CreateJoinTableTeaSubscription < ActiveRecord::Migration[5.2]
  def change
    create_join_table :teas, :subscriptions do |t|
      # t.index [:tea_id, :subscription_id]
      # t.index [:subscription_id, :tea_id]
    end
  end
end
