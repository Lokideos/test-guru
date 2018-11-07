# frozen_string_literal: true

module AnswersHelper
  def answer_correct_state(answer)
    if answer.correct
      I18n.t('helper_methods.answers.correct')
    else
      I18n.t('helper_methods.answers.incorrect')
    end
  end
end
