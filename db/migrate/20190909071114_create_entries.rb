class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.string :number
      t.timestamp :processed_at

      t.timestamps
    end
  end
end
