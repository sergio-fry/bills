class CreateTransactions < ActiveRecord::Migration[7.0]
  def up
    create_transactions

    drop_table :expenses
    drop_table :incomes
  end

  def down
    create_expenses
    create_incomes
    drop_table :transactions
  end

  def create_transactions
    create_table :transactions, id: :uuid do |t|
      t.uuid :membership_id, null: true
      t.uuid :organization_id, null: false
      t.integer :amount, null: false
      t.string :comment
      t.date :date
      t.string :type

      t.timestamps
    end
  end

  def create_expenses
    create_table 'expenses', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
      t.uuid 'organization_id', null: false
      t.integer 'amount', null: false
      t.string 'comment'
      t.date 'date'
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
    end
  end

  def create_incomes
    create_table 'incomes', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
      t.uuid 'membership_id', null: false
      t.integer 'amount', null: false
      t.date 'date'
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
    end
  end
end
