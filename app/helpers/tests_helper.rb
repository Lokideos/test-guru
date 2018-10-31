# frozen_string_literal: true

module TestsHelper
  def level_in_human_form(test)
    levels = {
      0 => I18n.t('helper_methods.tests.levels.very_easy'),
      1 => I18n.t('helper_methods.tests.levels.easy'),
      2 => I18n.t('helper_methods.tests.levels.medium'),
      3 => I18n.t('helper_methods.tests.levels.hard'),
      4 => I18n.t('helper_methods.tests.levels.very_hard'),
      5 => I18n.t('helper_methods.tests.levels.brutal')
    }
    return levels[test.level] if levels[test.level]

    I18n.t('helper_methods.tests.levels.impossible')
  end
end
