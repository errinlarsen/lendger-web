class SaveLoan < Interactor
  attr_reader :request, :response

  def initialize(request={})
    @request = request
    @response = Response.new
  end

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

  def save_repository_in(repo_class)
    if request.params[:id]
      return update_repository(repo_class)
    else
      return repo_class.create(request.object_attributes)
    end
  end

  def update_repository_in(repo_class)
    repo = repo_class.find(request.params[:id])
    repo.update_attributes(request.object_attributes)
    return repo
  end

  def delete_from(repo_class)
    repo = repo_class.find(request.params[:id])
    repo.destroy
  end
end
