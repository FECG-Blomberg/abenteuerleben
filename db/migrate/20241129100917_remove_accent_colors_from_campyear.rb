class RemoveAccentColorsFromCampyear < ActiveRecord::Migration[7.2]
  def change
    remove_column :campyears, :accentcolor_primary
    remove_column :campyears, :accentcolor_secondary
  end
end
