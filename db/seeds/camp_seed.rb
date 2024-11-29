module Seeds
  class CampSeed
    def self.create_campyear
      Campyear.create!(
        year: DateTime.now.year,
        members_only_start: '2020-01-01', # TODO: remove
        participants_register_start: '2020-01-01',
        participants_register_end: '2030-01-01',
        helper_register_start: '2020-02-01',
        helper_register_end: '2030-01-01'
      )
    end

    def self.create_camp campyear_id
      Camp.create!(
        campyear_id: campyear_id,
        date_start: '2030-02-01',
        date_end: '2030-02-02',
        participants_year_start: 2009,
        participants_year_end: 2010,
        max_participant_count: 101,
        name: '1',
        price: 42
      )
    end
  end
end
