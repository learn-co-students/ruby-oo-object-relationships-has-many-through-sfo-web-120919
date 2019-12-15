class Customer
  attr_reader :name, :age

  @@all = []

  def initialize(name, age)
    @name = name
    @age = age
    save
  end

  def new_meal(waiter, total, tip)
    Meal.new(waiter, self, total, tip)
  end

  def meals
    all_meals = Meal.all
    my_meals = all_meals.select { |meal| meal.customer == self }
    my_meals
  end

  def waiters 
    meals.map {|meal| meal.waiter}
  end 



  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
end
