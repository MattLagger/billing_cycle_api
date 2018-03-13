class BillingCyclesController < ApplicationController
  before_action :set_billing_cycle, only: [:show, :update, :destroy]

  # GET /billing_cycles
  def index
    @billing_cycles = BillingCycle.all
    render json: @billing_cycles
  end

  def summary
    billing = BillingCycle.find(params[:billing_cycle_id])
    @credits = billing.credits.sum(:value)
    @debts = billing.debts.sum(:value)

    value = {:credits => @credits, :debts => @debts}.to_json

    render json: value
  end

  # GET /billing_cycles/1
  def show
    render json: @billing_cycle
  end

  def count
    @billing_count = BillingCycle.count
    render json: @billing_count
  end

  # POST /billing_cycles
  def create
    @billing_cycle = BillingCycle.new(billing_cycle_params)

    if @billing_cycle.save
      render json: @billing_cycle, status: :created, location: @billing_cycle
    else
      render json: @billing_cycle.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /billing_cycles/1
  def update
    if @billing_cycle.update(billing_cycle_params)
      render json: @billing_cycle
    else
      render json: @billing_cycle.errors, status: :unprocessable_entity
    end
  end

  # DELETE /billing_cycles/1
  def destroy
    @billing_cycle.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_billing_cycle
      @billing_cycle = BillingCycle.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def billing_cycle_params
      params.require(:billing_cycle).permit(:name, :month, :year)
    end
end
