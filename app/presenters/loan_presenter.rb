class LoanPresenter < Lendger::Presenter
  def self.applicable_to?(object, context)
    object.class.name == 'Loan' || object.class.name == 'LoanRepository'
  endo
end
