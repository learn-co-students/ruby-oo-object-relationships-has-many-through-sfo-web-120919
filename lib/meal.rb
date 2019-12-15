class Meal
  attr_reader :customer, :waiter, :total, :tip

  @@all = []

  def initialize(waiter, customer, total, tip)
    @waiter = waiter
    @customer = customer
    @total = total
    @tip = tip
    save
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
end
