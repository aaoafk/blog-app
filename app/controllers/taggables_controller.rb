class TaggablesController < ApplicationController
  before_action :set_taggable_and_articles, only: %i[show]
  def index
    @taggables = Taggable.all
  end

  def show
  end
  
  private

  def set_taggable_and_articles
    @taggable = Taggable.find_by id: params[:id]
    @articles = @taggable.articles
  end
end
