# frozen_string_literal: true

module TestsHelper
  LEVELS = {
    0 => 'very_easy',
    1 => 'easy',
    2 => 'medium',
    3 => 'hard',
    4 => 'very_hard',
    5 => 'brutal'
  }.freeze

  def level_in_human_form(test)
    return I18n.t("helper_methods.tests.levels.#{LEVELS[test.level]}") if LEVELS.include? test.level

    I18n.t('helper_methods.tests.levels.impossible')
  end
end
