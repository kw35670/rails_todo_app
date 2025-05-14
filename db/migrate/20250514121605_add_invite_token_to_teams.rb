class AddInviteTokenToTeams < ActiveRecord::Migration[8.0]
  def change
    add_column :teams, :invite_token, :string
  end
end
