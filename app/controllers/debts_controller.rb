class DebtsController < ApplicationController
  before_action :set_debt, only: [:show, :update, :destroy]
  before_action :set_billing

  # GET /debts
  def index
    @debts = @billing.debts

    render json: @debts
  end

  def show
    render json: @debt
  end

  # POST /debts
  def create
    @debt = @billing.debts.create(debt_params)

    if @debt.save
      render json: @debt, status: :created
    else
      render json: @debt.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /debts/1
  def update
    if @debt.update(debt_params)
      render json: @debt
    else
      render json: @debt.errors, status: :unprocessable_entity
    end
  end

  # DELETE /debts/1
  def destroy
    @debt.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_debt
      @bilingCycle = BillingCycle.find(params[:billing_cycle_id])
      @debt = @bilingCycle.debts.find(params[:id])
    end

    def set_billing
      @billing = BillingCycle.find(params[:billing_cycle_id])
    end

    # Only allow a trusted parameter "white list" through.
    def debt_params
      params.require(:debt).permit(:name, :value, :status, :billing_cycle_id)
    end
end
