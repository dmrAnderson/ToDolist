# frozen_string_literal: true

#  First step in this project
class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end