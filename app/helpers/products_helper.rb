module ProductsHelper

  def show_badge(product)
    product.quantity.zero? ? '' : 'hidden'
  end

  def disable_button(product)
    product.quantity.zero? ? 'disabled' : ''
  end

end