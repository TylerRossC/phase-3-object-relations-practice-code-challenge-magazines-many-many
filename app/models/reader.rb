class Reader < ActiveRecord::Base
  has_many :subscriptions
  has_many :magazines, through: :subscriptions

    def subscribe(magazine, price)
        Subscription.create(price: price, magazine_id: magazine.id, reader_id: self.id)
    end

    def total_subscription_price
        self.subscriptions.pluck(:price).sum
    end

    def cancel_subscription(magazine)
        self.subscriptions.where("magazine_id == ?", magazine.id).destroy_all
    end
end