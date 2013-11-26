require_relative "../../interactor"
require_relative "../../entities/loan"

module Lendger
  class SaveLoan < Interactor
    def perform
      loan = Loan.new(request[:loan])

      if loan.valid?
        persisted = create_or_update(loan)
        context[:loan] = presenter.exhibit(persisted)
      else
        fail!(loan: presenter.exhibit(loan))
      end
    end
  end
end
