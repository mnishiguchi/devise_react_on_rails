class AdminsController < ApplicationController
  before_action :set_admin, only: [:show]

  # GET /admins/1
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_params
      params.fetch(:admin, {})
    end
end
