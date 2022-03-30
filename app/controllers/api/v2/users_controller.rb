#module V2
  class Api::V2::UsersController < ApplicationController
    
    before_action :set_user, only: %i[ show update destroy ]
    
    # GET /users
    def index
      page = (params[:page] || 1).to_i
      per_page = (params[:per_page] || 7).to_i
      # Aceita requisições: localhost:3000/api/v2/users?page=10&per_page=10
      @users = User.all.page(page).per(per_page)
      render json: @users
    end
    
    # GET /users/1
    def show
      render json: @user
    end
    
    # GET /users/email
    def show_email
      @user_email = User.find_by(email: params[:email]+"."+params[:format])
      @user_packages = Package.where(user_id: @user_email.id)
      render json: @user_packages
    end
    
    #POST /users
    def create
      @user = User.new(user_params)
      
      if @user.save
        render json: @user, status: :created, location: api_v2_user_url(@user)
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
    
    # PATCH/PUT /users/1
    def update
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
    
    # DELETE /users/1
    def destroy
      @user.destroy
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
#end