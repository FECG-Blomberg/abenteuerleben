require 'test_helper'

class CampsControllerTest < ActionDispatch::IntegrationTest
  test 'block selection to full camps' do
    # prepare
    camp1 = Campyear.active_camp.camps.first
    camp1.max_participant_count = 0
    camp1.save

    camp2 = Campyear.active_camp.camps.second
    camp2.max_participant_count = 100
    camp2.save

    # execute
    get new_child_registration_url

    # check
    assert_select ".camp-select__label:nth-child(1)" do
      assert_select '.camp-select__full-camp-label'
    end

    assert_select ".camp-select__label:nth-child(2)" do
      assert_select "input[type='radio']"
    end
  end
end
