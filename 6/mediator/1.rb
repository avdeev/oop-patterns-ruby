class Order
  def set_name name
    p "order set name: #{name}"
  end
end

class PaymentGateway
  def prepare name
    p "payment prepare for: #{name}"
  end
end

class AddressService
  def set name
    p "address set for: #{name}"
  end
end