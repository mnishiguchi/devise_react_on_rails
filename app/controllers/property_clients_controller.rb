class PropertyClientsController < ApplicationController
  before_action :set_property_client, only: [:show]

  # # GET /property_clients
  # def index
  #   @property_clients = PropertyClient.all
  # end

  # GET /property_clients/1
  def show
  end

  # # GET /property_clients/new
  # def new
  #   @property_client = PropertyClient.new
  # end
  #
  # # GET /property_clients/1/edit
  # def edit
  # end
  #
  # # POST /property_clients
  # def create
  #   @property_client = PropertyClient.new(property_client_params)
  #
  #   if @property_client.save
  #     redirect_to @property_client, notice: 'Property client was successfully created.'
  #   else
  #     render :new
  #   end
  # end
  #
  # # PATCH/PUT /property_clients/1
  # def update
  #   if @property_client.update(property_client_params)
  #     redirect_to @property_client, notice: 'Property client was successfully updated.'
  #   else
  #     render :edit
  #   end
  # end
  #
  # # DELETE /property_clients/1
  # def destroy
  #   @property_client.destroy
  #   redirect_to property_clients_url, notice: 'Property client was successfully destroyed.'
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property_client
      @property_client = PropertyClient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_client_params
      params.fetch(:property_client, {})
    end
end
