class MoneyrecordsController < ApplicationController
  before_action :set_moneyrecord, only: [:show, :edit, :update, :destroy]

  # GET /moneyrecords
  # GET /moneyrecords.json
  def index
    @moneyrecords = Moneyrecord.all
  end

  # GET /moneyrecords/1
  # GET /moneyrecords/1.json
  def show
  end

  # GET /moneyrecords/new
  def new
    @moneyrecord = Moneyrecord.new
  end

  # GET /moneyrecords/1/edit
  def edit
  end

  # POST /moneyrecords
  # POST /moneyrecords.json
  def create
    @moneyrecord = Moneyrecord.new(moneyrecord_params)

    respond_to do |format|
      if @moneyrecord.save
        format.html { redirect_to @moneyrecord, notice: 'Moneyrecord was successfully created.' }
        format.json { render :show, status: :created, location: @moneyrecord }
      else
        format.html { render :new }
        format.json { render json: @moneyrecord.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /moneyrecords/1
  # PATCH/PUT /moneyrecords/1.json
  def update
    respond_to do |format|
      if @moneyrecord.update(moneyrecord_params)
        format.html { redirect_to @moneyrecord, notice: 'Moneyrecord was successfully updated.' }
        format.json { render :show, status: :ok, location: @moneyrecord }
      else
        format.html { render :edit }
        format.json { render json: @moneyrecord.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moneyrecords/1
  # DELETE /moneyrecords/1.json
  def destroy
    @moneyrecord.destroy
    respond_to do |format|
      format.html { redirect_to moneyrecords_url, notice: 'Moneyrecord was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_moneyrecord
      @moneyrecord = Moneyrecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def moneyrecord_params
      params.require(:moneyrecord).permit(:name, :category_id)
    end
end
