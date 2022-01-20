class TaggablesController < ApplicationController
  before_action :set_taggable_and_articles, only: %i[show]
  def index
    @taggables = Taggable.all
  end

  def show
  end
  
  private

  #TODO: Why is the collection being stringified in the view???
  def set_taggable_and_articles
    #Grab articles that reference this tag
    @taggable = Taggable.find_by id: params[:id]
    @articles = @taggable.articles
  end
end
