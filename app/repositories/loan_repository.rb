class LoanRepository < ActiveRecord::Base
  self.table_name = "loan_repository"

  belongs_to :person,  class_name: "person_repository",
                      foreign_key: :person_repository_id
end
