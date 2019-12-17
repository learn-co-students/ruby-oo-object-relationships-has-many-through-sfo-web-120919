class Customer

  attr_accessor :name, :age

  @@all = []

  def initialize(name, age)
    @name = name
    @age = age
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(waiter, total, tip=0)
    Meal.new(waiter, self, total, tip)
  end

  def meals
    #find a particular customer's meals
    Meal.all.select do |meal|
      meal.customer == self
    end
  end
  
  def waiters
    # meals returned a subset of meals
    # related to our Customer instance
    #.  Now we map through to
    #create a new array of all
    #the waiters our customers
    # have been served by.
    meals.map do |meal|
      meal.waiter
    end
  end


end