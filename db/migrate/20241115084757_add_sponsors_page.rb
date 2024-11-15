class AddSponsorsPage < ActiveRecord::Migration[7.2]
  def change
    Page.create url: 'sponsoren', content: ''
  end
end
