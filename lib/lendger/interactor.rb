require "interactor"

module Lendger
  class Interactor
    include ::Interactor

    private
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
end
