class MoneyrecordsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_moneyrecord, only: [:show, :edit, :update, :destroy]
  before_action :set_category_list
  before_filter :require_permission, only: [:show, :edit, :update, :destroy]

  # GET /moneyrecords
  # GET /moneyrecords.json
  def index
    if params[:date_from].present? or params[:date_to].present?
      date_from = params[:date_from].present? ? params[:date_from] : 0
      date_to = params[:date_to].present? ? params[:date_to] : Date.today
      @moneyrecords = Moneyrecord
                          .where(category_id: params[:category_id].present? ? params[:category_id] : current_user.categories {|i| i.id})
                          .where('made_at >= ? AND made_at <= ?', date_from.to_time, date_to.to_time + 1.days)
                          .order(made_at: :desc)
    else
      if params[:category_id].present?
        category = Category
                       .where(user_id: current_user.id)
                       .where(id: params[:category_id])
                       .first

        @moneyrecords = category.moneyrecords.order(made_at: :desc)
      else
        @moneyrecords = Moneyrecord
                            .where(category_id: current_user.categories {|i| i.id})
                            .order(made_at: :desc)
                            .take(100)
      end
    end

  end

  # GET /moneyrecords/1
  # GET /moneyrecords/1.json
  def show
  end

  # GET /moneyrecords/new
  def new
    @moneyrecord = Moneyrecord.new
    @selected_category = params[:category_id].to_i if params[:category_id].present?
  end

  # GET /moneyrecords/1/edit
  def edit
    @selected_category = @moneyrecord.category_id
  end

  # POST /moneyrecords
  # POST /moneyrecords.json
  def create
    @moneyrecord = Moneyrecord.new(moneyrecord_params)
    @moneyrecord.made_at = Date.today

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

    # Set categories for user
    def set_category_list
      if params[:category_id].present?
        @category_list = current_user.categories.where(id: params[:category_id]).map { |category| [category.name, category.id] }
      else
        @category_list = current_user.categories.map { |category| [category.name, category.id] }
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def moneyrecord_params
      params.require(:moneyrecord).permit(:name, :category_id, :made_at, :amount, :date_from, :date_to)
    end

    # Do action only for current user
    def require_permission
      if current_user.id != @moneyrecord.category.user_id
        redirect_to root_path
      end
    end

end
