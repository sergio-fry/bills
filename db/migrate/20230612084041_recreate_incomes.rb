class RecreateIncomes < ActiveRecord::Migration[7.0]
  def up
    drop_table :incomes

    create_table :incomes, id: :uuid do |t|
      t.uuid :membership_id, null: false
      t.integer :amount, null: false
      t.date :date

      t.timestamps
    end
  end

  def down
    drop_table :incomes

    create_table :incomes do |t|
      t.uuid :membership_id, null: false
      t.integer :amount, null: false
      t.date :date

      t.timestamps
    end
  end
end
