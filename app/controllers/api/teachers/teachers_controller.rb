class Api::Teachers::TeachersController < Api::BaseController
  before_action :authenticate_user!, :check_permissions

  def check_permissions
    head 403 unless current_user.role == 'teacher' && current_user.is_validated == true
  end
end
