class Api::V1::CourseSessionsController < Api::BaseController
  before_action :set_course_session, only: %i[show update destroy]
  before_action :admin?, only: %i[create update destroy]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @course_sessions = CourseSession.all
    render json: CourseSessionSerializer.new(@course_sessions)
  end

  def show
    render json: @course
  end

  def create
    @course_session = CourseSession.new(course_session_params)
    if @course_session.save
      render json: @course_session, status: :created, location: api_v1_course_sessions_url(@course_session)
    else
      render json: @course_session.errors, status: :unprocessable_entity
    end
  end

  def update
    if @course_session.update(course_session_params)
      render json: @course_session
    else
      render json: @course_session.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @course_session.destroy
  end

  private

  def set_course_session
    @course_session = CourseSession.find(params[:id])
  end

  def course_session_params
    params.require(:course_session).permit(:date, :classroom_id, :course_id)
  end
end
