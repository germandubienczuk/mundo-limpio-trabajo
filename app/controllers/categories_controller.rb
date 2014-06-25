class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /categories
  # GET /categories.json
  def index
    unless current_user.nil?
      if current_user.admin? 
      else 
        redirect_to root_path, notice: 'Debe ser administrador para poder manejar este menu' 
      end 
    end
    @legend = "Listado y Busqueda Categorias"
    @categories = Category.search(params[:search]).page(params[:page]).per(5)
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @legend = "Datos del Proveedor"
    unless current_user.nil?
      if current_user.admin? 
      else 
        redirect_to root_path, notice: 'Debe ser administrador para poder manejar este menu' 
      end 
    end
  end

  # GET /categories/new
  def new
    unless current_user.nil?
      if current_user.admin? 
      else 
        redirect_to root_path, notice: 'Debe ser administrador para poder manejar este menu' 
      end 
    end
    @legend = "Nueva Categoria"
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
    unless current_user.nil?
      if current_user.admin? 
      else 
        redirect_to root_path, notice: 'Debe ser administrador para poder manejar este menu' 
      end 
    end
    @legend = "Editar Categoria"
  end

  # POST /categories
  # POST /categories.json
  def create
    @legend = "Nueva Categoria"
    unless current_user.nil?
      if current_user.admin? 
      else 
        redirect_to root_path, notice: 'Debe ser administrador para poder manejar este menu' 
      end 
    end

    @category = Category.new(category_params)

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
    unless current_user.nil?
      if current_user.admin? 
      else 
        redirect_to root_path, notice: 'Debe ser administrador para poder manejar este menu' 
      end 
    end
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
    unless current_user.nil?
      if current_user.admin? 
      else 
        redirect_to root_path, notice: 'Debe ser administrador para poder manejar este menu' 
      end 
    end
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
      params.require(:category).permit(:name)
    end
end
