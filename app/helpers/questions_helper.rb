# frozen_string_literal: true

module QuestionsHelper
  def question_header(question)
    if question.new_record?
      I18n.t('helper_methods.questions.create_question')
    else
      I18n.t('helper_methods.questions.edit_question', body: question.body)
    end
  end
end
