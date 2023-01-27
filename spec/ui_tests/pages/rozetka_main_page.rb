require_relative 'base_page'

class RozetkaMainPage < BasePage


  def find_gamezone_link
    find(:css, "ul.menu-categories.menu-categories_type_main li a[href*='game-zone']", match: :first)
  end

  def find_household_appliances_link
    find(:css, "ul.menu-categories.menu-categories_type_main li a[href*='https://bt.rozetka.com.ua/']", match: :first)
  end

  def find_cart_icon
    find(:css, "rz-cart.header-actions__component", match: :first).click
  end

end
