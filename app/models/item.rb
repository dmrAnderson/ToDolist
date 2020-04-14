# frozen_string_literal: true

# comment
class Item < ApplicationRecord
  belongs_to :list
  validates  :description, length: { in: 1..50 }
  validates  :list_id,     presence: true

  def done_or_undone
    toggle!(:completed)
  end
end
