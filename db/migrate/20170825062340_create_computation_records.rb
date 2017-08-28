class CreateComputationRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :computation_records do |t|
      t.string :name
      t.date :dor
      t.string :ag_no
      t.integer :amount_comm
      t.integer :comm_value
      t.date :payment_date

      t.timestamps
    end
  end
end
