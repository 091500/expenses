class AddAmountToMoneyrecords < ActiveRecord::Migration
  def change
    add_column :moneyrecords, :amount, :integer
  end
end
