class CreditsController < ApplicationController
  before_action :set_credit, only: [:show, :update, :destroy]
  before_action :set_billing

  # GET /credits
  def index
    @credits = @billing.credits

    render json: @credits
  end

  # GET /credits/1
  def show
    render json: @credit
  end

  # POST /credits
  def create
    @credit = @billing.credits.create(credit_params)
    if @credit.save
      render json: @credit, status: :created
    else
      render json: @credit.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /credits/1
  def update
    if @credit.update(credit_params)
      render json: @credit
    else
      render json: @credit.errors, status: :unprocessable_entity
    end
  end

  # DELETE /credits/1
  def destroy
    @credit.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credit
      @billing = BillingCycle.find(params[:billing_cycle_id])
      @credit = @billing.credits.find(params[:id])
    end

    def set_billing
      @billing = BillingCycle.find(params[:billing_cycle_id])
    end

    # Only allow a trusted parameter "white list" through.
    def credit_params
      params.require(:credit).permit(:name, :value, :billing_cycle_id)
    end
end
