class Waiter

    def initialize(name, years_of_experience)
        @name = name
        @years_of_experience = years_of_experience
        save
    end


    def save
        self.class.all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select { |meal| meal.waiter == self }
    end

    def baller
        best_tip = 0
        best_tipper = nil
        meals.map do |meal| 
            if meal.tip > best_tip
                best_tip = meal.tip
                best_tipper = meal.customer
            end
        end
        best_tipper
    end

end