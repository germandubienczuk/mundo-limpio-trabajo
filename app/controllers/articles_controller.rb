class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  @legend = ""

  def helpers
    ActionController::Base.helpers
  end

  # GET /articles
  # GET /articles.json
  def index
    unless current_user.nil?
    if current_user.admin? 
      else 
        redirect_to root_path, notice: 'Debe ser administrador para poder manejar este menu' 
      end 
    end
    @articles = Article.search(params[:search]).page(params[:page]).per(20)
    @legend = "Listado y Busqueda Articulos"
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    unless current_user.nil?
      if current_user.admin? 
      else 
        redirect_to root_path, notice: 'Debe ser administrador para poder manejar este menu' 
      end 
    end
    @legend = "Datos del Artículo"
  end

  # GET /articles/new
  def new
    unless current_user.nil?
      if current_user.admin? 
      else 
        redirect_to root_path, notice: 'Debe ser administrador para poder manejar este menu' 
      end 
    end
    @article = Article.new
    @legend = "Nuevo Artículo"
  end

  # GET /articles/1/edit
  def edit
    @legend = "Editar Artículo"
    unless current_user.nil?
      if current_user.admin? 
      else 
        redirect_to root_path, notice: 'Debe ser administrador para poder manejar este menu' 
      end 
    end
  end

  # POST /articles
  # POST /articles.json
  def create
    @legend = "Nuevo Artículo"
    unless current_user.nil?
      if current_user.admin? 
      else 
        redirect_to root_path, notice: 'Debe ser administrador para poder manejar este menu' 
      end 
    end
    
    @article = Article.new(article_params)
    

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Artículo creado con éxito' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    unless current_user.nil?
      if current_user.admin? 
      else 
        redirect_to root_path, notice: 'Debe ser administrador para poder manejar este menu' 
      end 
    end
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Artículo editado con exito' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    unless current_user.nil?
      if current_user.admin? 
      else 
        redirect_to root_path, notice: 'Debe ser administrador para poder manejar este menu' 
      end 
    end
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Artículo' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:description, :price_cost, :price, :price_card, :bar_code, :category_id)
    end
end
