require "application_system_test_case"

class ChildRegistrationTest < ApplicationSystemTestCase
  setup do
    @child = children(:one)
    @parent = parent_parents(:one)
  end

  test "should create child registration" do
    visit parent_parents_path

    click_on 'Zur Anmeldung'

    fill_in 'v2_parent[surname]', with: @parent.surname
    fill_in 'v2_parent[forename]', with: @parent.surname

    fill_in 'Telefonnr. 1', with: @parent.telephone
    fill_in 'Email', with: @parent.email

    fill_in 'Straße', with: @parent.street
    fill_in 'Hausnr', with: @parent.house
    fill_in 'PLZ', with: @parent.post
    fill_in 'Stadt', with: @parent.city

    fill_in 'v2_parent[children_attributes][0][surname]', with: @child.surname
    fill_in 'v2_parent[children_attributes][0][forename]', with: @child.forename
    fill_in 'v2_parent[children_attributes][0][birthday]', with: @child.birthday
    select 'Junge', from: 'v2_parent[children_attributes][0][sex]'
    choose 'Camp 1'

    check "v2_parent[liability_exclusion]"
    click_on "Als gelesen markieren"

    check "v2_parent[important_information]"
    click_on "Als gelesen markieren"

    check "v2_parent[canceling_info]"
    click_on "Als gelesen markieren"

    check 'v2_parent[data_protection]'

    check 'v2_parent[photo_rights]'

    click_on 'Verbindlich und kostenpflichtig anmelden'

    assert_text "Erfolgreich angemeldet"
  end

  # test "should create child registration for non-member" do
  #   visit parent_parents_path
  #
  #   click_on 'Zur Anmeldung'
  #
  #   fill_in 'surname', with: @parent.surname
  #   fill_in 'forename', with: @parent.surname
  #   find("label[for='member']").click
  #   click_on 'Weiter'
  #
  #   fill_in 'parent_contact_telephone', with: @parent.telephone
  #   fill_in 'parent_contact_email', with: @parent.email
  #   click_on 'Weiter'
  #
  #   fill_in 'parent_location_street', with: @parent.street
  #   fill_in 'parent_location_house', with: @parent.house
  #   fill_in 'parent_location_post', with: @parent.post
  #   fill_in 'parent_location_city', with: @parent.city
  #   click_on 'Weiter'
  #
  #   fill_in 'Wie viele Kinder sollen angemeldet werden?', with: 1
  #   click_on 'Weiter'
  #
  #   find("#child_camp_id_#{camps(:one).id}").click
  #   fill_in 'child_surname', with: @child.surname
  #   fill_in 'child_forename', with: @child.forename
  #   select '28', from: 'child_birthday_3i'
  #   select 'Juni', from: 'child_birthday_2i'
  #   select '2008', from: 'child_birthday_1i'
  #   find('#child_label_boy').click
  #   click_on 'Weiter'
  #
  #   check "parent_parent_liability_exclusion"
  #   click_on "Als gelesen markieren"
  #
  #   check "parent_parent_important_information"
  #   click_on "Als gelesen markieren"
  #
  #   check "parent_parent_canceling_info"
  #   click_on "Als gelesen markieren"
  #
  #   check 'parent_parent_data_protection'
  #
  #   check 'parent_parent_photo_rights'
  #
  #   click_on 'Verbindlich und kostenpflichtig anmelden'
  #
  #   assert_text "Erfolgreich angemeldet, eine Email mit mehr Infos ist auf dem Weg zu dir"
  # end


  # test "should not create child registration if no time for non church members" do
  # end

  # test "should not create child registration if invalid email" do
  # end

end

