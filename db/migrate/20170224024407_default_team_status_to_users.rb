class DefaultTeamStatusToUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :team, :boolean, :default => false
  end
end
