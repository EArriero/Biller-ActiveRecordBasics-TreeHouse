class AccountEntries < ActiveRecord::Migration
  def change
  	add_column :time_entries, :account_id, :integer
  	rename_table :time_entries, :account_entries
  	add_column :account_entries, :type, :string
  	
  end
end
