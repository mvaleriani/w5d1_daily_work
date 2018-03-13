class AddCompletionToGoals < ActiveRecord::Migration[5.1]
  def change
    add_column :goals, :completed, :string
  end
end
