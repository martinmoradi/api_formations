class Api::BaseController < ApplicationController
  respond_to :json

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found
    render json: {
      'errors': [
        {
          'status': '404',
          'title': 'Not Found'
        }
      ]
    }, status: 404
  end

  def validated?
    head 403 unless current_user.is_validated
  end

  def admin?
    head 403 unless current_user.role == 'admin'
  end

  def teacher?
    head 403 unless current_user.role == 'teacher'
  end

end
