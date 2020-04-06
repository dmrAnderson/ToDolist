# frozen_string_literal: true

# Items model
class Item < ApplicationRecord
  belongs_to :user
end
