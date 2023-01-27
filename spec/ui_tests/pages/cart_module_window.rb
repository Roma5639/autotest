require_relative  'base_page'


class CartModuleWindow < BasePage
  def find_services_section
    find(:css, ".cart-product__services.ng-star-inserted")
  end

  def find_continue_shopping_button
    find(:xpath, "//rz-shopping-cart//*[contains(text(),'Продовжити покупки')]", match: :first)
  end

end
