class AddSupportAgentToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :support_agent, :boolean
  end
end
