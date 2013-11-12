class DeleteLoan < Interactor
  def call
    @response = delete_from(LoanRepository)
    return response
  end
end
