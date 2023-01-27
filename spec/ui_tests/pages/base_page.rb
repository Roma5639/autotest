require 'rspec'


class BasePage

  def verify_title_is_displayed (page_title)
    expect(page.title).to include(page_title)
  end

  def find_first_item_from_catalog
    find(:css, ".catalog-grid__cell:nth-of-type(1) span.goods-tile__title", match: :first)
  end

  def find_second_item_from_catalog
    find(:css, ".catalog-grid__cell:nth-of-type(1) span.goods-tile__title", match: :first)
  end

  def find_last_item_from_catalog
    find(:css, ".catalog-grid__cell:nth-of-type(60)")
  end


  def get_el_price (el)
    first_price = find(:css, el, match: :first).text
    first_price.delete('₴ ,').to_i
  end

  def go_back
    page.go_back
  end



end
