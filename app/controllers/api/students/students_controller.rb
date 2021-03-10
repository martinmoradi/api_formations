class Api::Students::StudentsController < Api::BaseController
  before_action :authenticate_user!, :check_permissions

  def check_permissions
    head 403 unless current_user.role == 'student' && current_user.is_validated == true
  end
end
