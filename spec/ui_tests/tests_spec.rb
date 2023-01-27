

describe 'Rozetka' do
    context 'when testing Rozetka' do
      before :each do
        Capybara.page.driver.browser.manage.window.maximize
        visit 'https://rozetka.com.ua'
      end

      let(:rozetka_main_page) {RozetkaMainPage.new}
      let(:game_zone_page) {GameZonePage.new}
      let(:consoles) {Consoles.new}
      let(:household_appliances) {HouseholdAppliancesPage.new}
      let(:blenders) {BlendersPage.new}
      let(:item_page) {ItemPage.new}
      let(:cart_module_window) {CartModuleWindow.new}


      let(:game_zone_title) { 'Товари для геймерів' }
      let(:console_title) { 'Ігрові приставки' }
      let(:sign_in_popup_title) { 'Вхід' }
      let(:goods_items) { 'span.goods-tile__price-value' }
      let(:valid_email) { 'jerome.de.core@gmail.com' }
      let(:valid_username) { 'Jerome-Anchel-Victoria Bonne-Renault-D\'core' }
      let(:valid_password) { '22RomaMarket77' }
      let(:my_orders_title) { 'Мої замовлення' }
      let(:invalid_email) { 'xxx' }
      let(:household_appliances_title) { 'Побутова техніка' }
      let(:blenders_title_text) { 'Блендери' }
      let(:blenders_title_link) { "h1.catalog-heading.ng-star-inserted" }
      let(:product_price) { 'p.product-prices__big.product-prices__big_color_red' }
      let(:notification_text) { 'Товар додано до кошика' }
      let(:basket_popup_title) { 'Кошик' }
      let(:basket_sum_price) { 'div.cart-receipt__sum-price' }
      let(:basket_sum_price) { 'div.cart-receipt__sum-price' }
      let(:image_container_locator) { 'img.picture-container__picture' }
      let(:product_trade_locator) { 'img.picture-container__picture' }
      let(:notification_block_locator) { "div.notification__block" }
      let(:notification_text_locator) { "h1.catalog-heading.ng-star-inserted" }




      it 'checks the cheapest item from the item\'s list', :cheapest_item do
        rozetka_main_page.find_gamezone_link.click
        game_zone_page.find_gamezone_header
        expect(page.title).to include(game_zone_title)
        game_zone_page.find_and_click_consoles_link
        expect(page.title).to include(console_title)
        consoles.find_last_item_from_catalog
        consoles.find_lowest_number_from(goods_items)
      end


      it 'check order sum calculation is correct', :calculation do
        rozetka_main_page.find_household_appliances_link.click
        household_appliances.find_household_appliances_title
        expect(page.title).to include(household_appliances_title)
        household_appliances.find_blenders_link.click
        blenders.find_blenders_title
        expect(page).to have_css(blenders_title_link, text: blenders_title_text)
        blenders.find_first_item_from_catalog.click
        expect(item_page.element_is_visible(image_container_locator))
        expect(item_page.element_is_visible(product_trade_locator))
        print first_item_price = get_el_price(product_price)
        item_page.find_buy_button.click
        #page.driver.browser.action.move_to(page.find(:css, "span.buy-button__label.ng-star-inserted").native).perform
        item_page.find_services_section
        sleep(5)
        item_page.find_buy_button.click
        sleep(5)
        cart_module_window.find_services_section
        #page.driver.browser.action.move_to(page.find(:xpath, "//rz-shopping-cart//*[contains(text(),'Продовжити покупки')]").native).perform
        cart_module_window.find_continue_shopping_button.click
        cart_module_window.go_back
        blenders.find_second_item_from_catalog.click
        second_item_price = item_page.get_el_price(product_price)
        item_page.go_back
        item_page.find_second_item_from_catalog.click
        element_is_visible(notification_block_locator)
        expect(page).to have_css(notification_text_locator, text: notification_text)
        #binding.pry
        rozetka_main_page.find_cart_icon.click
        expect(page).to have_css("h3.modal__heading", text: basket_popup_title)
        expect(get_el_price(basket_sum_price) == first_item_price + second_item_price)
        puts "Prices comparing: #{get_el_price(basket_sum_price) } = #{first_item_price + second_item_price}"
      end


      it 'checks valid user is able to login' do
        find(:css, "rz-user.header-actions__component", match: :first).click
        expect(page).to have_css("h3.modal__heading", text: sign_in_popup_title)
        find(:css, "#auth_email").send_keys(valid_email)
        find(:css, "#auth_pass").send_keys(valid_password)
        binding.pry
        puts "type capture manually and press enter"
        gets.chomp
        find(:css, "button.auth-modal__submit", match: :first).click
        find(:css, "rz-user.header-actions__component", match: :first).click
        expect(page.title).to include(my_orders_title)
        expect(page).to have_css("p.cabinet-user__name", text: valid_username)
        expect(page).to have_css("p.cabinet-user__email", text: valid_email)
      end
    end
    def element_is_visible (selector)
      expect(page).to have_selector(:css, selector, match: :first, visible: true)
    end
    end
