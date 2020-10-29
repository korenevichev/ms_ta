class RecipesController < ApplicationController
  def index
    @entries = Recipes::List.new.call
  end

  def show
    @entry = Recipes::Find.new.call(id: params[:id])
    render 'not_found', status: 404 unless @entry
  end
end
