require_relative 'base_page'

class HouseholdAppliancesPage < BasePage

  def find_household_appliances_title
    find(:css, ".portal__heading.ng-star-inserted")
  end

  def find_blenders_link
    find(:css, "[title='Блендери']", match: :first)
  end
end
