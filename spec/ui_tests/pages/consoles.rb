require_relative 'base_page'


class Consoles < BasePage


  def find_lowest_number_from (elements)
    item_list = find_all(:css, elements).map(&:text)
    print item_list
    puts " The cheapest console's price is #{item_list.min} hrn"
  end
end
