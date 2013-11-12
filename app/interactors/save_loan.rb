class SaveLoan < Interactor
  def call
    loan = Loan.new(request.object_attributes)
    check_validity_of(loan)
    return response
  end

  private
  def check_validity_of(loan)
    if loan.valid?
      save_loan
    else
      reject_loan
    end
  end

  def save_loan
    repo = save_repository_in(LoanRepository)
    @response.loan = repo.attributes
  end

  def reject_loan
    @response.loan = request.object_attributes
    @response.loan.errors = loan.errors
  end
end
