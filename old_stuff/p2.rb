class Exercise2
  def book
    listing_id = ask_user
    validate_selection(listing_id)
    result = book_listing_with_retries(listing_id)
    puts "Result: #{result}"
  end

  def ask_user
    puts 'Which of these listings would you like to view?'
    BackendApi.listings.select { |listing| listing[:available] }.each do |listing|
      index = listing[:id]
      description = listing[:description]
      price = listing[:price]
      puts "#{index}: #{description}, price: #{price}"
    end

    parse_input
  end

  def validate_selection(listing_id)
    # this gets the user's selection.
    listing_to_book = BackendApi.listings.select {|listing| listing[:id] == listing_id}

    if listing_to_book.empty?
      puts 'Invalid listing selection!'
    end
  end


  private

  def parse_input
    gets.chomp.to_i
  end

  def book_listing_with_retries(listing_id)
    BackendApi.book_listing(listing_id)
  rescue BackendApi::NetworkError
    puts 'NetworkError encountered! Retrying...'
    book_listing_with_retries(listing_id)
  end
end

###########################################################
### Here's your backend. Do not alter any of this code! ###
###########################################################

class BackendApi
  class NetworkError < StandardError; end

  LISTINGS = [
    {
      id: 1,
      description: 'Romantic getaway in the heart of North Korea',
      price: 20.00,
      available: true,
    },
    {
      id: 6,
      description: 'Exotic yurt on busy street in downtown Manhattan',
      price: 80.00,
      available: false,
    },
    {
      id: 20,
      description: 'In my bathtub, on a bed made of newspapers',
      price: 9.00,
      available: true,
    },
  ].freeze

  FAILURE_RATE = 0.25

  def self.listings
    LISTINGS
  end

  def self.book_listing(id)
    raise NetworkError if rand > FAILURE_RATE
    # random network failures!

    listing = listings.detect { |listing| listing[:id] == id }

    if listing[:available]
      listing[:available] = false
      200
    else
      500
    end
  end
end

##### Now let's give it a go. Instantiate a new P2! #####
Exercise2.new.book
