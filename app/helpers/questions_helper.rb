# frozen_string_literal: true

module QuestionsHelper
  def question_header(question)
    test = question.test.title

    if question.new_record?
      "Create New #{test} Question"
    else
      "Edit #{test} Question"
    end
  end
end
