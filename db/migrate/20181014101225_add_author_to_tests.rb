# frozen_string_literal: true

class AddAuthorToTests < ActiveRecord::Migration[5.2]
  def change
    add_belongs_to :tests, :author
  end
end
