class Api::Students::SessionAttendeesController < Api::Students::StudentsController
  before_action :set_session_attendee, only: %i[show update destroy]

  def index
    @session_attendees = SessionAttendee.where(student_id: current_user.id)
    render json: @session_attendees
  end

  def show
    render json: @session_attendee
  end

  def create
    @session_attendee = SessionAttendee.new(session_attendee_params)
    @session_attendee.student_id = current_user.id
    puts @session_attendee.inspect
    if @session_attendee.save
      render json: @session_attendee, status: :created
    else
      render json: @session_attendee.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @session_attendee.delete
  end

  private

  def set_session_attendee
    @session_attendee = SessionAttendee.where(student_id: current_user.id).find(params[:id])
  end

  def session_attendee_params
    params.require(:session_attendee).permit(:assessment, :student_id, :course_session_id)
  end
end
