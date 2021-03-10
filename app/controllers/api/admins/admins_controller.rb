class Api::Admins::AdminsController < Api::BaseController
  before_action :authenticate_user!, :check_permissions

  def check_permissions
    head 403 unless current_user.role == 'admin' && current_user.is_validated == true
  end
end
