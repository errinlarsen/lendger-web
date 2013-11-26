require_relative "../interactor"

module Lendger
  class DeleteLoan < Interactor
    def perform
      fail! unless repository.find(request[:id]).destroy
    end
  end
end
