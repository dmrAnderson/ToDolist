class AddCompletedToItem < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :completed, :boolean, { default: false }
    add_column :items, :completed_at, :datetime
  end
end
