require 'pry'
class Magazine < ActiveRecord::Base
  has_many :subscriptions
  has_many :readers, through: :subscriptions

    def email_list
        # self.readers.map{|reader| reader.email}.join(";") # RUBY
        self.readers.pluck(:email).join(";")  # AR 
    end

    def self.most_popular
        array = self.all.map{|magazine| magazine.subscriptions.count}
        idx = array.index(array.max())
        self.all[idx]
    end

end
