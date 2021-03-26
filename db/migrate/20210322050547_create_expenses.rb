class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.string :name
      t.integer :amount
      t.bigint :author_id

      t.timestamps
    end
    add_index :expenses, :author_id
  end
end
