class LoansController < ActionController::Base
  respond_to :html
  before_filter :set_default_request

  def index
    @response = BrowseLoans.new(@request).call
    respond_with @response
  end

  def show
    @response = LoadLoan.new(@request).call
    respond_with @response
  end
  alias_method :edit, :show

  def new
    @response = NewLoan.new(@request).call
    respond_with @response
  end

  def create
    @request.object_aattributes = loan_params
    @response = SaveLoan.new(@request).call
    respond_with @response.loan, location: loans_path
  end
  alias_method :update, :create

  def destroy
    @response = DeleteLoan.new(@request).call
    respond_with @response, location: loans_path
  end

  protected
  def set_default_request
    @request = Request.new(params: params)
  end

  private
  def loan_params
    params.require(:loan).permit(:lender, :thing, :borrower)
  end
end
