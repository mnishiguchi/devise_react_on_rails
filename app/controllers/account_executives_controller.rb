class AccountExecutivesController < ApplicationController
  before_action :set_account_executive, only: [:show]

  # # GET /account_executives
  # def index
  #   @account_executives = AccountExecutive.all
  # end

  # GET /account_executives/1
  def show
  end

  # # GET /account_executives/new
  # def new
  #   @account_executive = AccountExecutive.new
  # end
  #
  # # GET /account_executives/1/edit
  # def edit
  # end
  #
  # # POST /account_executives
  # def create
  #   @account_executive = AccountExecutive.new(account_executive_params)
  #
  #   if @account_executive.save
  #     edirect_to @account_executive, notice: 'Account executive was successfully created.'
  #   else
  #     render :new
  #   end
  # end
  #
  # # PATCH/PUT /account_executives/1
  # def update
  #   if @account_executive.update(account_executive_params)
  #     redirect_to @account_executive, notice: 'Account executive was successfully updated.'
  #   else
  #     render :edit
  #   end
  # end
  #
  # # DELETE /account_executives/1
  # def destroy
  #   @account_executive.destroy
  #   redirect_to account_executives_url, notice: 'Account executive was successfully destroyed.'
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account_executive
      @account_executive = AccountExecutive.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_executive_params
      params.fetch(:account_executive, {})
    end
end
