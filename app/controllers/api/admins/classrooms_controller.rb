class Api::Admins::ClassroomsController < Api::Admins::AdminsController
  before_action :set_classroom, only: %i[show update destroy]

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
      render json: @classroom, status: :created
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
