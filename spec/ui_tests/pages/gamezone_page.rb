require_relative 'base_page'


class GameZonePage < BasePage
  def find_gamezone_header
    find(:css, "h1.portal__heading.ng-star-inserted")
  end

  def find_and_click_consoles_link
    find(:css, "[alt = 'Ігрові приставки']").click
  end
end

