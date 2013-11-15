class NewLoan < Interactor
  def call
    @response.loan = Loan.new
    return response
  end
end
