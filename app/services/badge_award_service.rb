# frozen_string_literal: true

class BadgeAwardService
  def initialize(test_passage, user)
    @test_passage = test_passage
    @user = user
  end

  def call
    badges = []

    BadgeAcquisitionRule.all.each do |rule|
      badges_of_rule = rule.badges

      if send("passed_#{rule.acquisition_type}_rule?", rule.acquisition_options)
        badges.push(badges_of_rule)
      end
    end

    badges
  end

  private

  def passed_category_rule?(category)
    all_tests_of_category_done = false
    passages = all_user_test_passages

    Test.by_category(category).each do |test|
      all_tests_of_category_done = false
      break if test_passage_exists_for_test?(test)

      passages.each do |passage|
        all_tests_of_category_done = true if passage.test_passed?
      end
    end

    all_tests_of_category_done
  end

  def passed_first_try_rule?(_options = nil)
    first_try_success = false
    passages = all_user_test_passages

    if passages.count == 1
      first_try_success = true if passages.first.test_passed?
    end

    first_try_success
  end

  def passed_level_rule?(level)
    all_tests_of_level_done = false
    passages = all_user_test_passages

    Test.with_level(level).each do |test|
      all_tests_of_level_done = false
      break if test_passage_exists_for_test?(test)

      passages.each do |passage|
        all_tests_of_level_done = true if passage.test_passed?
      end
    end

    all_tests_of_level_done
  end

  def all_user_test_passages
    TestPassage.where(test_id: @test_passage.test.id).where(user_id: @user.id)
  end

  def test_passage_exists_for_test?(test)
    TestPassage.where(test_id: test.id).where(user_id: @user.id).first.nil?
  end
end
