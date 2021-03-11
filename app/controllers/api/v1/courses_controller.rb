class Api::V1::CoursesController < Api::BaseController
  before_action :set_course, only: %i[show update destroy]
  before_action :admin?, only: %i[create update destroy]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @courses = Course.all
    render json: CourseSerializer.new(@courses)
  end

  def show
    render json: @course
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      render json: @course, status: :created
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  def update
    if @course.update(course_params)
      render json: @course
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @course.delete
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :teacher_id)
  end
end
