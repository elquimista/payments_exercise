class AddTimestampsToPaymets < ActiveRecord::Migration[5.2]
  def change
    change_table :payments do |t|
      t.timestamps null: true
    end
  end
end
