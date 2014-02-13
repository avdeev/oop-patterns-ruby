class Colleague
  attr_accessor :processor
  def initialize processor
    @processor = processor
  end
end

class Order < Colleague
  def set_name name
    p "order set name: #{name}"
    @processor.set_name name, self
  end
end

class PaymentGateway < Colleague
  def prepare name
    p "payment prepare for: #{name}"
  end
end

class AddressService < Colleague
  def set name
    p "address set for: #{name}"
  end
end

class OrderProcessor
  attr_accessor :order, :address, :payment
  def set_name name, colleague
    if colleague == @order
      payment.prepare name
      address.set name
    end
  end
end

processor = OrderProcessor.new

payment = PaymentGateway.new processor
order = Order.new processor
address = AddressService.new processor

processor.order = order
processor.payment = payment
processor.address = address

order.set_name 'Alexey'