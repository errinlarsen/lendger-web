class BrowseLoans < Interactor
  def call
    @response.loans = LoanRepository.all.map(&:attributes)
    return response
  end
end
