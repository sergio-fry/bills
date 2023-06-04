class CreateIncomes < ActiveRecord::Migration[7.0]
  def change
    create_table :incomes do |t|
      t.uuid :membership_id, null: false
      t.integer :amount, null: false
      t.date :date

      t.timestamps
    end
  end
end
