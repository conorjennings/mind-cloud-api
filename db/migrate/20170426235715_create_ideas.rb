class CreateIdeas < ActiveRecord::Migration[5.0]
  def change
    create_table :ideas do |t|
      # Limit character length to 100.
      t.string :content, null: false, :limit => 100

      t.timestamps
    end
  end
end
