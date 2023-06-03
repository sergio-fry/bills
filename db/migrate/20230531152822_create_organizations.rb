class CreateOrganizations < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :organizations, id: :uuid do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
