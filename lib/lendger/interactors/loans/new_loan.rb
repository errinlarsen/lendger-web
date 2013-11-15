require_relative "../../interactor"

module Lendger
  class NewLoan < Interactor
    def perform
      context[:loan] = Loan.new
    end
  end
end
