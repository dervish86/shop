class Api::V1::CategoriesController < ApplicationController
  def index
    @categories = Category.not_empty.sorted
  end

  def show
    @category = Category.find(params[:id])
  end
end
