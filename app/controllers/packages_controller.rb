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