class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses, id: :uuid do |t|
      t.uuid :organization_id, null: false
      t.integer :amount, null: false
      t.string :comment
      t.date :date

      t.timestamps
    end
  end
end
