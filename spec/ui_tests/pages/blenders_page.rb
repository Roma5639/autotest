require_relative 'base_page'

class BlendersPage < BasePage

  def find_blenders_title
    find(:css, "h1.catalog-heading.ng-star-inserted", match: :first)
  end




end
