# frozen_string_literal: true

# Items model
class Item < ApplicationRecord
  belongs_to :list
  validates  :title,       length: { in: 1..50 }
  validates  :description, length: { in: 1..150 }
  validates  :list_id,     presence: true

  def done_or_undone
    toggle!(:completed)
  end
end
