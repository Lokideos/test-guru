# frozen_string_literal: true

module TestsHelper
  EN_LEVELS = {
    0 => 'very easy',
    1 => 'easy',
    2 => 'medium',
    3 => 'hard',
    4 => 'very hard',
    5 => 'brutal'
  }.freeze

  RU_LEVELS = {
    0 => 'очень просто',
    1 => 'просто',
    2 => 'непросто',
    3 => 'сложно',
    4 => 'очень сложно',
    5 => 'брутально'
  }.freeze

  def level_in_human_form(test)
    if I18n.locale == :en
      return EN_LEVELS[test.level] if EN_LEVELS[test.level]

      'impossible'
    else
      return RU_LEVELS[test.level] if RU_LEVELS[test.level]

      'невозможно'
    end
  end
end
