# frozen_string_literal: true

class AddDefaultValueToAnswerCorrect < ActiveRecord::Migration[5.2]
  def change
    change_column :answers, :correct, :boolean, default: false
  end
end
