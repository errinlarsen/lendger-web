require_relative "../../interactor"
require_relative "../../entities/loan"

module Lendger
  class NewLoan < Interactor
    def perform
      loan = Loan.new
      context[:loan] = presenter.exhibit(loan)
    end
  end
end
