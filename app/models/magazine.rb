class Magazine < ActiveRecord::Base
  has_many :subscriptions
  has_many :readers, through: :subscriptions

  def email_list
    # Approach 1
    # get all the readers of this magazine
    # readers_arr = self.readers
    # # pull out all of those readers' emails
    # emails_arr = readers_arr.map { |reader_insance| reader_insance.email }
    # # format those email with semicolons after each one
    # emails_arr.join(";")

    # Approach 2
    # emails_arr = self.readers.map do |reader_insance|
    #   reader_insance.email
    # end

    # emails_arr.join(";")

    # Approach 3
    self.readers.map { |reader| reader.email }.join(";")
  end

  def self.most_popular
    # APPROACH 1
    # get the first magazine and figure out how many subscriptions it has; assume that
    # this first magazine has the most subscriptions/it's the most popular
    # most_popular_magazine = Magazine.first
    # # iterate over all of the magazines and compare it to the current most popular magazine
    # Magazine.all.each do |mag_instance|
    #   if mag_instance.subscriptions.count > most_popular_magazine.subscriptions.count
    #     most_popular_magazine = mag_instance
    #   end
    # end

    # most_popular_magazine

    # APPRAOCH 2
    # self.all.max_by { |magazine| magazine.subscriptions.count }

    # APPROACH 3
    self.all.sort { |a, b| a.subscriptions.length <=> b.subscriptions.length }.last
  end
end
