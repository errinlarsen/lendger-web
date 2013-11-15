module Lendger
  class SaveLoan < Interactor
    def perform
      if (loan = Loan.new(model_attributes)).valid?
        persist
      else
        reject(loan) && fail!
      end
    end

    private
    def persist
      loan_repository = save_repository(LoanRepository)
      context[:loan] = loan_repository.attributes
    end

    def reject_loan(loan)
      context[:loan] = model_attributes
      loan[:errors] = loan.errors
    end
  end
end
