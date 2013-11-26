require_relative "../../interactor"
require_relative "../../entities/loan"

module Lendger
  class BrowseLoans < Interactor
    def perform
      loans = repository.all.map { |p| Loan.new(p.attributes) }
      context[:loans] = presenter.exhibit(loans)
    end
  end
end
