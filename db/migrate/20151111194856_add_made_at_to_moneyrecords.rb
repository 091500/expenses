class AddMadeAtToMoneyrecords < ActiveRecord::Migration
  def change
    add_column :moneyrecords, :made_at, :datetime
  end
end
