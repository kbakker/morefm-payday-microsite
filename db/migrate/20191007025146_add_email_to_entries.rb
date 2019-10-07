class AddEmailToEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :entries, :email, :string
  end
end
