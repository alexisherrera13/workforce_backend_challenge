class CreateOrganisations < ActiveRecord::Migration[6.1]
  def change
    create_table :organisations do |t|
      t.string :name
      t.decimal :hourly_rate, precision: 8, scale: 2

      t.timestamps
    end
  end
end
