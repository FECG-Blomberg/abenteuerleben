module Seeds
  class HelperSeed
    def self.create_helper(camp_id)
      helper = Helper.new
      helper.photo.attach(io: Tempfile.new('helper one image.png'), filename: 'img.png')
      helper.surname = 'hSurname'
      helper.forename = 'hForename'
      helper.birthday = '2000-01-01'
      helper.birthplace = 'Helpercity Neighborhood'
      helper.telephone = '012345 67890'
      helper.email = 'helper@example.com'
      helper.streethouse = 'helperstreet 1'
      helper.postcity = '12345 helpercity'
      helper.story = 'I was once a simple helper'
      helper.duty = 'Helping my my sole purpose'
      helper.preferredCamp = 'none particularly'
      helper.registrations.push(new_helper_registration(camp_id))
      helper.save!
    end

    def self.new_helper_registration camp_id
      Registration.new(
        camp_id: camp_id,
        wish_first: 'helperDutyOne',
        wish_second: 'helperDutyTwo',
        participate: true
      )
    end
  end
end
