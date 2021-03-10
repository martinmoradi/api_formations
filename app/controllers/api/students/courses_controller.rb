class Api::Students::CoursesController < Api::Students::StudentsController
  before_action :set_course, only: [:show]

  def index
    @courses = Course.all
    # render json: @courses, include: [:teacher, :categories]
    render json: {
      status: { code: 200 },
      data: CourseSerializer.new(@courses).serializable_hash
    }
  end

  def show
    render json: @course
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end
end
