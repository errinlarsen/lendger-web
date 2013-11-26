class LoanRepository < ActiveRecord::Base
  extend Lendger::Repository

  self.table_name = "loan_repository"

  belongs_to :person, class_name: "person_repository", foreign_key: :person_id
  has_one :lender, class_name: "person_repository", foreign_key: :lender_id
  has_one :thing, class_name: "thing_repository", foreign_key: :thing_id
  has_one :borrower, class_name: "person_repository", foreign_key: :borrower_id
end
