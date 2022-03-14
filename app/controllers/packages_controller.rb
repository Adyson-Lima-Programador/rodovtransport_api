class PackagesController < ApplicationController
  
  before_action :set_user, only: %i[ show update destroy ]
  
  # GET /users
  def index
    @users = User.all
    
    render json: @users
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :category)
    end
  
end