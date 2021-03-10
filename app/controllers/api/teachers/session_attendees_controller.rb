class Api::Teachers::SessionAttendeesController < Api::Teachers::TeachersController
  before_action :set_session_attendee, only: %i[show update destroy]

  def index
    @session_attendees = SessionAttendees.all
    render json: @session_attendees
  end

  def show
    render json: @session_attendee
  end

  def update
    if @session_attendee.update(session_attendee_params)
      render json: @session_attendee
    else
      render json: @session_attendee.errors, status: :unprocessable_entity
    end
  end

  private

  def set_session_attendee
    @session_attendee = SessionAttendees.find(params[:id])
  end

  def session_attendee_params
    params.require(:session_attendee).permit(:assessment, :student_id, :session_id)
  end
end
