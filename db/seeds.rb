require_relative 'seeds/helper_seed'
require_relative 'seeds/camp_seed'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
campyear = Seeds::CampSeed.create_campyear
camp = Seeds::CampSeed.create_camp(campyear.id)
helper = Seeds::HelperSeed.create_helper(camp.id)

User.create!([{
                name: 'admin',
                password_hash: 'admin',
                email: '',
                level: 0b111
              }, {
                name: 'moderator',
                password_hash: 'moderator',
                email: '',
                level: 0b001
              }])

# Event.create!([
#                 {
#                   title: 'testtermin',
#                   description: 'this is the description of the testtermin',
#                   start_date: '2023-12-31',
#                   link: ''
#                 },
#                 {
#                   title: 'testtermin 2 with a longer title than it should actually be',
#                   description: 'this is the description of the testtermin which is actuall als on the a little bit longer side',
#                   start_date: '2023-12-31'
#                 }
#               ])

# Page.create!([
#                {
#                  url: 'datenschutz',
#                  content: ''
#                },
#                {
#                  url: 'impressum',
#                  content: ''
#                },
#                {
#                  url: 'mitarbeiter_haftungsausschluss',
#                  content: ''
#                },
#                {
#                  url: 'stornierungsregeln',
#                  content: ''
#                },
#                {
#                  url: 'mitarbeiter_wichtige-infos',
#                  content: ''
#                },
#                {
#                  url: 'eltern_wichtige-informationen',
#                  content: ''
#                },
#                {
#                  url: 'eltern_haftungsausschluss',
#                  content: ''
#                }
#              ])

# p "Created #{User.count} users"

Team.create!([
               {
                 name: 'Handwerker',
                 description: 'Handwerker bauen dies und das',
                 enabled: true
               },
               {
                 name: 'Sportler',
                 description: 'Sportler bewegen sich viel',
                 enabled: true
               },
               {
                 name: 'Sauerkraut',
                 description: 'Sauerkraut macht sauer, du musst aufpassen, dass das nicht passiert',
                 enabled: true
               },
               {
                 name: 'Sonstiges',
                 description: 'Sonstiges machen alles',
                 enabled: true
               },
               {
                 name: 'Nachtwächter',
                 description: 'Bewachen die Nacht',
                 enabled: false
               }
             ])

# p "Created #{Team.count} teams"
