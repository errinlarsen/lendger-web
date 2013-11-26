require "interactor"

module Lendger
  class Interactor
    include ::Interactor

    private
    def create_or_update(entity)
      if request[:id].nil?
        return repository.create(entity.attributes)
      else
        persisted = repository.find(request[:id])
        return persisted.update_attributes(entity.attributes)
      end
    end
  end
end
