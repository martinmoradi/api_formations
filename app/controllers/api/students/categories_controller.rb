class Api::Students::CategoriesController < Api::Students::StudentsController
  def show
    @courses = Course.where
    render json: @category
  end
end
