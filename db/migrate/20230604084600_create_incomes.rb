class CreateIncomes < ActiveRecord::Migration[7.0]
  def change
    create_table :incomes, id: :uuid do |t|
      t.uuid :membership_id, null: false
      t.integer :amount, null: false
      t.date :date

      t.timestamps
    end
  end
end
