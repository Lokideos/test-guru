# frozen_string_literal: true

module QuestionsHelper
  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/PerceivedComplexity
  def question_header(question)
    if I18n.locale == :en
      if question.new_record?
        'New Question'
      else
        "Edit #{question.body}"
      end
    elsif I18n.locale == :ru
      if question.new_record?
        'Новый вопрос'
      else
        "Редактирование #{question.body}"
      end
    end
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/PerceivedComplexity
end
