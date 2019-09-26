require_relative 'taximeter.rb'

class Taxi
  attr_reader :max_passenger_capacity, :taximeter, :max_bags_capacity, :current_passengers, :current_bags
  BASE_FARE = 40
  KM_COST = 5
  MINUTE_COST = 1

  # This is a comment, initialize is a method
  def initialize(max_passenger_capacity, max_bags_capacity)
    # Arguments can have the same name or not than variables
 
    @max_passenger_capacity = max_passenger_capacity
    @max_bags_capacity = max_bags_capacity
    @current_passengers = 0
    @current_bags = 0
    @taximeter = Taximeter.new(BASE_FARE, KM_COST, MINUTE_COST)
  end

  def add_bag(number_of_bags=1)
    available_places_for_bags=@max_bags_capacity-@current_bags
    if number_of_bags <= available_places_for_bags 
      @current_bags = @current_bags + number_of_bags
    else
      puts "No hay suficiente lugar. #{available_places_for_bags} lugares disponibles"
    end
end

  def remove_bag(number_of_bags=1)
    if @current_bags - number_of_bags  >= 0 
        @current_bags=@current_bags - number_of_bags
    else
      puts "Hay cargadas #{@current_bags} valijas en el taxi. No hay #{number_of_bags} valijas para remover"
    end  
  end

  def add_passenger(number_of_passengers=1)
    available_seats=@max_passenger_capacity-@current_passengers
    if number_of_passengers <=available_seats
        @current_passengers=@current_passengers+number_of_passengers
    else
      puts "No hay suficientes asientos. Quedan #{available_seats} asientos disponibles"
    end
  end

  def remove_passenger(number_of_passengers=1)
    # You can do it. Keep in mind that you can't remove more passengers than current_passengers.
    if @current_passengers-number_of_passengers>=0
      @current_passengers=@current_passengers-number_of_passengers
    else
      puts "Hay #{current_passengers} pasajeros en el taxi. No se pueden remover #{number_of_passengers} pasajeros"
    end
  end

 def calculate_trip_cost(trip_distance_in_kms, trip_duration_in_mins)
   @taximeter.calculate_trip_cost(trip_distance_in_kms, trip_duration_in_mins)
end
end