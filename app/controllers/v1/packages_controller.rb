module V1
  class PackagesController < ApplicationController
    
    before_action :set_package, only: %i[ show update destroy ]
    
    # GET /packages
    def index
      @packages = Package.all
      
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
        render json: @package, status: :created, location: @package
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
        params.require(:package).permit(:content, :status)
      end
    
  end
end