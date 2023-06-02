class CreateMemberships < ActiveRecord::Migration[7.0]
  def up
    create_table :memberships, id: :uuid do |t|
      t.uuid :user_id, null: false
      t.uuid :organization_id, null: false

      t.timestamps
    end

    execute 'ALTER TABLE memberships ADD UNIQUE (user_id, organization_id)'
  end

  def down
    drop_table :memberships
  end
end
