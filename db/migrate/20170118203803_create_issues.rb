class CreateIssues < ActiveRecord::Migration[5.0]
  def change
    create_table :issues do |t|
      t.string :title
      t.text :description
      t.references :creator, foreign_key: { to_table: :users }
      t.references :assignee, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
