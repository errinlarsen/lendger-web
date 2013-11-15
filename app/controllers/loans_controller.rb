require "lendger/loan_interactors"

class LoansController < ActionController::Base
  respond_to :html

  def index
    interactor = Lendger::BrowseLoans.perform
    respond_with @loans = interactor.loans
  end

  def show  # and edit
    interactor = Lendger::LoadLoan.perform(context)
    respond_with @loan = interactor.loan
  end
  alias_method :edit, :show

  def new
    interactor = Lendger::NewLoan.perform
    respond_with @loan = interactor.loan
  end

  def create  # and update
    interactor = Lendger::SaveLoan.perform(context)
    @loan = interactor.loan
    respond_with @loan, location: loans_path
  end
  alias_method :update, :create

  def destroy
    interactor = Lendger::DeleteLoan.perform(context)
    @loan = interactor.loan
    respond_with @loan, location: loans_path
  end

  private
  def context
    return { params: params, model_attributes: loan_params }
  end

  def loan_params
    return params.require(:loan).permit(:lender, :thing, :borrower)
  end
end
