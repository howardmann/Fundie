class AddBankToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bank, :decimal, :default => 5000
  end
end
