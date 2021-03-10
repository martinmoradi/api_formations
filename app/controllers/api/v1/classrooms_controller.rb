class Api::V1::ClassroomsController < Api::BaseController
  before_action :set_classroom, only: %i[show update destroy]
  before_action :authenticate_user!
  before_action :admin?, only: %i[create update destroy]

  def index
    @classrooms = Classroom.all
    render json: @classrooms
  end

  def show
    render json: @classroom
  end

  def create
    @classroom = Classroom.new(classroom_params)
    if @classroom.save
      render json: @classroom, status: :created, location: api_v1_classrooms_url(@classroom)
    else
      render json: @classroom.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @classroom.destroy
  end

  private

  def set_classroom
    @classroom = Classroom.find(params[:id])
  end

  def classroom_params
    params.require(:classroom).permit(:room_location)
  end
end
