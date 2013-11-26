require "lendger/loan_interactors"

class LoansController < ActionController::Base
  def index
    @loans = Lendger::BrowseLoans.perform(context).loans
  end

  def show  # and edit
    @loan = Lendger::LoadLoan.perform(context).loan
  end
  alias_method :edit, :show

  def new
    @loan = Lendger::NewLoan.perform(context).loan
  end

  def create  # and update
    results = Lendger::SaveLoan.perform(context)

    if results.success?
      flash.notice = "Loan saved successfully."
      redirect_to results.loan
    else
      flash.new.alert = "Loan was not saved"
      render :new
    end
  end
  alias_method :update, :create

  def destroy
    results = Lendger::DeleteLoan.perform(context)

    if results.success?
      flash.notice = "Loan was deleted successfully."
    else
      flash.alert = "loan was not deleted."
    end

    redirect to loans_path
  end

  private
  def context
    return { repository: LoanRepository, presenter: LoanPresenter, request: params }
  end
end
