class Country
  attr_reader :tax_rate

  def initialize(opts)
    @tax_rate = opts[:tax_rate]
  end
end

class Reservation2
  def initialize(opts)
    @opts = opts
  end

  def total_price
    tax_rate = @opts[:country].tax_rate
    @opts[:daily_price] * @opts[:days] * (1 + tax_rate)
  end
end

cuba = Country.new(tax_rate: 0.08)
reservation = Reservation2.new(daily_price: 50.0, days: 2, country: cuba)
puts "Time to check out! You pay: #{reservation.total_price}"
