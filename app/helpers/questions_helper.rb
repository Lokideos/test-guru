# frozen_string_literal: true

module QuestionsHelper
  def question_header(question)
    test = question.test.title

    return "Create New #{test} Question" if current_page?(controller: 'questions', action: 'show')

    "Edit #{test} Question"
  end
end
