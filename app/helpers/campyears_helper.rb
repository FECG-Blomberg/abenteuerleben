# frozen_string_literal: true

module CampyearsHelper
  # @deprecated
  def active_campyear
    Campyear.active_camp
  end
end
