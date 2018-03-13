class CreateCredits < ActiveRecord::Migration[5.1]
  def change
    create_table :credits do |t|
      t.string :name, required: true
      t.decimal :value, precision: 8, scale: 2, required: true, min: 0
      t.references :billing_cycle, foreign_key: true

      t.timestamps
    end
  end
end
