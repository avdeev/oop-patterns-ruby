module CoffeeProvider
  def order
    take_payment
    give_change
    make_coffee
  end
end

class AmericanCoffeeShop
  include CoffeeProvider
  def make_coffee
    Coffee.new :ingredients => [ :water, :mud ]
  end
end

class ItalianCoffeeShop
  include CoffeeProvider
  def make_coffee
    Espresso.new
  end
end

shop = AmericanCoffeeShop.new
shop.make_coffee()