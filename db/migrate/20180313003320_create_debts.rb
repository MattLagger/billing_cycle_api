class CreateDebts < ActiveRecord::Migration[5.1]
  def change
    create_table :debts do |t|
      t.string :name
      t.decimal :value, precision: 8, scale: 2, min: 0, required: true
      t.references :billingCycle, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
