class Waiter

  attr_accessor :name, :yrs_experience

  @@all = []

  def initialize(name, yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip=0)
    Meal.new(self, customer, total, tip)
  end

  #who tips a waiter the best?

  #1.  First we need to get a list of
  #all the meals the waiter instance has
  # served by defining a meals method:

  def meals
    Meal.all.select do | meal |
    meal.waiter == self
    end
  end


#Now that we have an array of all
#the meals our Waiter instance has served,
# let's define #best_tipper to find the
#best tipper

  def best_tipper
    best_tipped_meal = meals.max do | meal_a, meal_b |
      meal_a.tip <=> meal_b.tip
    end
    best_tipped_meal.customer
  end

end