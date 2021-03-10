class Api::V1::SessionAttendeesController < Api::BaseController
  before_action :set_session_attendee, only: %i[show update destroy]
  before_action :authenticate_user!, except: %i[index]

  def index
    @session_attendees = SessionAttendee.all
    render json: CourseSessionSerializer.new(@session_attendees)
  end

  def show
    render json: @session_attendee
  end

  def create
    @session_attendee = SessionAttendees.new(session_attendee_params)
    if @session_attendee.save
      render json: @session_attendee, status: :created, location: api_v1_session_attendees_url(@session_attendee)
    else
      render json: @session_attendee.errors, status: :unprocessable_entity
    end
  end

  def update
    if @session_attendee.update(session_attendee_params)
      render json: @session_attendee
    else
      render json: @session_attendee.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @session_attendee.delete
  end

  private

  def set_session_attendee
    @session_attendee = SessionAttendee.find(params[:id])
  end

  def session_attendee_params
    params.require(:session_attendee).permit(:assessment, :student_id, :session_id)
  end
end
