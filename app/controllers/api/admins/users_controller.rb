class Api::Admins::UsersController < Api::Admins::AdminsController
  before_action :set_user, only: %i[show update destroy]

  def index
    @users = User.to_validate
    render json: @users
  end

  def show
    render json: @user
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.delete
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :is_validated, :role, :first_name, :last_name)
  end
end
