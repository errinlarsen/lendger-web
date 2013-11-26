class CreateLoanRepository < ActiveRecord::Migration
  def change
    create_table :loan_repository do |t|
      t.integer :person_id
      t.timestamps
    end

    add_index :loan_repository, :person_id
  end
end
