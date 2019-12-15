class Waiter
  attr_reader :name, :age

  @@all = []

  def initialize(name, age)
    @name = name
    @age = age
    save
  end

  def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
  end

  def meals
    all_meals = Meal.all
    my_meals = all_meals.select { |meal| meal.waiter == self }
    my_meals
  end

  def customers
    meals.map { |meal| meal.customer }
  end

  def best_tipper
    meals.max_by {|meal| meal.tip}.customer 
  end 

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
end
