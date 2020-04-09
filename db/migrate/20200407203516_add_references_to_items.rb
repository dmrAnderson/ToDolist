# frozen_string_literal: true

class AddReferencesToItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :items, :list, foreign_key: true
  end
end
