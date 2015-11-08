class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /categories
  # GET /categories.json
  def index
    if params[:record_type]
      @category = Category.where(record_type: params[:record_type], user_id: current_user.id).all
    else
      @category = Category.where(user_id: current_user.id).all
    end
  end

  def category_incomes

  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new

    @record_types = [['Income', 1], ['Expense', 0]]
    @selected_record_type = params[:record_type]
  end

  # GET /categories/1/edit
  def edit
    @record_types = [['Income', 1], ['Expense', 0]]
    @selected_record_type = @category.record_type

  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)

    @category.user = current_user
    @record_types = [['Income', 1], ['Expense', 0]]
    @selected_record_type = 1

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :record_type, :user_id)
    end
end
