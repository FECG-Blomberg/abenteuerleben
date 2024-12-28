require "test_helper"

class ParentTest < ActiveSupport::TestCase
  test  "telephone to whatsapp format works just fine" do
    cases = [
      "+49 12 34567",
      "+491234567",
      "491 234567",
      "491234567",
      "01234567",
      "0 123 4567",
    ]

    cases.each do |number|
      # prepare
      p = Parent::Parent.new
      p.telephone = number

      # execute
      formatted_number = p.wa_telephone

      # check
      assert_equal "491234567", formatted_number
    end
  end

  test  "telephone to whatsapp format works just fine for non-german numbers" do
    # prepare
    p = Parent::Parent.new
    p.telephone = "+22 123 4567"

    # execute
    formatted_number = p.wa_telephone

    # check
    assert_equal "221234567", formatted_number
  end

  test 'parent email is being stripped of whitespace before validation' do
    # without space works
    p = V2::Parent.new
    p.email = 'example@example.com'
    p.validate
    puts p.errors.to_json
    refute_includes p.errors, 'email'

    # with space at end also works
    p = V2::Parent.new
    p.email = 'example@example.com '
    p.validate
    puts p.errors.to_json
    refute_includes p.errors, 'email'
  end
end
