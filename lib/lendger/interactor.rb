require "interactor"

module Lendger
  class Interactor
    include ::Interactor

    private
    def save_repository(repo_class)
      if params[:id].nil?
        return repo_class.create(model_attributes)
      else
        return update_repository(repo_class)
      end
    end

    def update_repository(repo_class)
      repository = repo_class.find(params[:id])
      return repository.update_attributes(model_attributes)
    end

    def delete_from(repo_class)
      return repo_class.find(params[:id]).destroy
    end
  end
end
