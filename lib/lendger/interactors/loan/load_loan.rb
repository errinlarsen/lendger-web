require_relative "../../interactor"
require_relative "../../entities/loan"

module Lendger
  class LoadLoan < Interactor
    def perform
      persisted = repository.find(request[:id])
      loan = Loan.new(persisted.attributes)
      context[:loan] = presenter.exhibit(loan)
    end
  end
end
