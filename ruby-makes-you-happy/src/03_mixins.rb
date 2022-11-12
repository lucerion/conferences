#!/usr/bin/env ruby

class SportCar
end

car = SportCar.new
# car.speed


module SportEngine
  def speed
    320
  end
end

class SportCar
  include SportEngine
end

p car.speed


module Engine
  def speed
    140
  end
end

class Car
  extend Engine
end

p Car.speed
p car.speed
