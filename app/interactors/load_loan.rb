class LoadLoan < Interactor
  def call
    @response.loan = LoanRepository.find(request.params[:id])
    return response
  end
end
