class Subscription < ActiveRecord::Base
  belongs_to :reader # Subsription#reader
  belongs_to :magazine

  def print_details
    puts "#{self.reader.name} subscribed to #{self.magazine.title} for $#{self.price}"
  end

  # def reader
  #   Reader.find(self.reader_id)
  # end

  # def magazine
  #   Magazine.find(self.magazine._id)
  # end
end
