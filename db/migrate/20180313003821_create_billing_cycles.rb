class CreateBillingCycles < ActiveRecord::Migration[5.1]
  def change
    create_table :billing_cycles do |t|
      t.string :name, required: true
      t.integer :month, min: 1, max: 12, required: true
      t.integer :year, min: 1970,  max: 2100, required: true

      t.timestamps
    end
  end
end
