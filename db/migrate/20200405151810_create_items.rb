# frozen_string_literal: true

# comment
class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :description

      t.timestamps
    end
  end
end
