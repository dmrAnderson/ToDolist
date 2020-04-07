# frozen_string_literal: true

# Items model
class Item < ApplicationRecord
  belongs_to :user
  validates :title, length: { in: 1..50 }
  validates :description, length: { in: 1..150 }
end
