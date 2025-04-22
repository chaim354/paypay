class PaymentLinksController < ApplicationController
  before_action :set_payment_link, only: %i[ show edit update destroy ]
  before_action :set_payment_platforms, only: %i[ new edit create update ]
  before_action :require_authentication, only: %i[ new edit create update destroy ]

  # GET /payment_links or /payment_links.json
  def index
    @payment_links = PaymentLink.all
  end

  # GET /payment_links/1 or /payment_links/1.json
  def show
  end

  # GET /payment_links/new
  def new
    @payment_link = PaymentLink.new
  end

  # GET /payment_links/1/edit
  def edit
  end

  # POST /payment_links or /payment_links.json
  def create
    @payment_link = PaymentLink.new()
    @payment_link.profile = Current.user.profile
    Rails.logger.debug("payment_link_params: #{payment_link_params[:payment_platform_id]}")
    @payment_link.payment_platform = PaymentPlatform.find(payment_link_params[:payment_platform_id])
    @payment_link.payid = payment_link_params[:payid]


    respond_to do |format|
      if @payment_link.save
        format.html { redirect_to @payment_link, notice: "Payment link was successfully created." }
        format.json { render :show, status: :created, location: @payment_link }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @payment_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payment_links/1 or /payment_links/1.json
  def update
    # @payment_link.payment_platform = PaymentPlatform.find(payment_link_params[:paymentplatform_id])
    respond_to do |format|
      if @payment_link.update(payment_link_params)
        format.html { redirect_to @payment_link, notice: "Payment link was successfully updated." }
        format.json { render :show, status: :ok, location: @payment_link }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @payment_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_links/1 or /payment_links/1.json
  def destroy
    @payment_link.destroy!

    respond_to do |format|
      format.html { redirect_to payment_links_path, status: :see_other, notice: "Payment link was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_payment_platforms
      @payment_platforms = PaymentPlatform.all
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_link
      @payment_link = PaymentLink.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def payment_link_params
      params.expect(payment_link: [ :payment_platform_id, :payid ])
    end
end
