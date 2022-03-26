#module V2
  class Api::V2::PackagesController < ApplicationController
    
    before_action :set_package, only: %i[ show update destroy ]
    
    # GET /packages
    def index
      page = (params[:page] || 1).to_i
      per_page = (params[:per_page] || 7).to_i
      # Aceita requisições: localhost:3000/api/v2/packages?page=10&per_page=10 
      @packages = Package.all.page(page).per(per_page)
      render json: @packages
    end
    
    # GET /packages/{id}
    def show
      render json: @package
    end
    
    #POST /packages
    def create
      @package = Package.new(package_params)
      
      if @package.save
        render json: @package, status: :created, location: api_v2_package_url(@package)
      else
        render json: @package.errors, status: :unprocessable_entity
      end
    end
    
    # PATCH/PUT /packages/{id}
    def update
      if @package.update(package_params)
        render json: @package
      else
        render json: @package.errors, status: :unprocessable_entity
      end
    end
    
    # DELETE /packages/{id}
    def destroy
      @package.destroy
    end
    
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_package
        @package = Package.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def package_params
        params.require(:package).permit(:content, :status, :user_id)
      end
    
  end
#end