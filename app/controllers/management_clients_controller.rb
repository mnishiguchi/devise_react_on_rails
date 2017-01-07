class ManagementClientsController < ApplicationController
  before_action :set_management_client, only: [:show]

  # # GET /management_clients
  # def index
  #   @management_clients = ManagementClient.all
  # end

  # GET /management_clients/1
  def show
  end

  # # GET /management_clients/new
  # def new
  #   @management_client = ManagementClient.new
  # end
  #
  # # GET /management_clients/1/edit
  # def edit
  # end
  #
  # # POST /management_clients
  # def create
  #   @management_client = ManagementClient.new(management_client_params)
  #
  #   if @management_client.save
  #     redirect_to @management_client, notice: 'Management client was successfully created.'
  #   else
  #     render :new
  #   end
  # end
  #
  # # PATCH/PUT /management_clients/1
  # def update
  #   if @management_client.update(management_client_params)
  #     fredirect_to @management_client, notice: 'Management client was successfully updated.'
  #   else
  #     render :edit
  #   end
  # end
  #
  # # DELETE /management_clients/1
  # def destroy
  #   @management_client.destroy
  #   redirect_to management_clients_url, notice: 'Management client was successfully destroyed.'
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_management_client
      @management_client = ManagementClient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def management_client_params
      params.fetch(:management_client, {})
    end
end
