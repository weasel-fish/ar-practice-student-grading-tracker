class Reader < ActiveRecord::Base
  has_many :subscriptions
  has_many :magazines, through: :subscriptions

#   def subscriptions
#     Subscription.all.select { |sub_instance| sub_instance.reader_id == self.id }
#   end

  def subscribe(magazine_instance, price_int)
    Subscription.create(magazine_id: magazine_instance.id, reader_id: self.id, price: price_int)
  end

  def total_subscription_price
    # APPROACH 1
    # prices = self.subscriptions.map do |sub_instance|
    #   sub_instance.price
    # end

    # prices.sum { |obj| obj }

    # APPROACH 2
    # self.subscriptions.sum do |sub_instance|
    #     sub_instance.price
    #   end

    # APPROACH 3
    # self.subscriptions.sum(:price)

    # APPROACH 4
    self.subscriptions.pluck(:price).sum
  end

  def cancel_subscription(mag_instance)
    # sub = Subscription.find_by(magazine_id: mag_instance.id, reader_id: self.id)
    # sub.destroy

    self.subscriptions.find_by(magazine_id: mag_instance.id).destroy
  end
end
