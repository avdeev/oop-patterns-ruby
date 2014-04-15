class OrderState
  attr_accessor :order
  def initialize order
    @order = order
  end
  def add_order_line
    raise NotImplementedError
  end
  def grant
    raise NotImplementedError
  end
  def ship
    raise NotImplementedError
  end
  def invoice
    raise NotImplementedError
  end
  def register
    raise NotImplementedError
  end
  def cancel
    raise NotImplementedError
  end
end

class NewOrder < OrderState
  def add_order_line
    p 'news line added'
  end
  def register
    p 'registered'
    @order = RegisteredOrder.new @order
  end
  def cancel
    p 'canceled'
    @order = CanceledOrder.new @order
  end
end

class RegisteredOrder < OrderState
  def add_order_line
    p 'news line added'
    @order = NewOrder.new @order
  end
  def grant
    p 'granted'
    @order = GrantedOrder.new @order
  end
  def cancel
    p 'canceled'
    @order = CanceledOrder.new @order
  end
end

class NewOrder < OrderState
  def add_order_line
    p 'news line added'
    @order = NewOrder.new @order
  end
  def ship
    p 'shipped'
    @order = ShippedOrder.new @order
  end
  def cancel
    p 'canceled'
    @order = CanceledOrder.new @order
  end
end

class ShippedOrder < OrderState
  def invoice
    p 'invoiced'
    @order = InvoicedOrder.new @order
  end
end

class CanceledOrder < OrderState; end
class InvoicedOrder < OrderState; end

class Order
  attr_accessor :state
  def initialize
    @state = NewOrder.new self
  end
  def add_order_line
    @state.add_order_line
  end
  def grant
    @state.grant
  end
  def ship
    @state.ship
  end
  def invoice
    @state.invoice
  end
  def register
    @state.register
  end
  def cancel
    @state.cancel
  end
end