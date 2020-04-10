# frozen_string_literal: true

# comment
class AddCompletedToItem < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :completed, :boolean, { default: false }
  end
end
