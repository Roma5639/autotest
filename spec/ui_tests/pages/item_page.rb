require_relative 'base_page'

class ItemPage < BasePage
  def find_buy_button
    find(:css, "span.buy-button__label.ng-star-inserted")
  end

  def find_services_section
    find(:css, "div.product-about__block-body .services")
  end
end
