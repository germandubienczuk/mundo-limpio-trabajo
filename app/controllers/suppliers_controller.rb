class SuppliersController < ApplicationController
  before_action :set_supplier, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
    # GET /suppliers
  # GET /suppliers.json
  
  @legend = "";
  
  def index
    unless current_user.nil?
      if current_user.admin? 
      else 
        redirect_to root_path, notice: 'Debe ser administrador para poder manejar este menu' 
      end 
    end
    @suppliers = Supplier.search(params[:search]).page(params[:page]).per(5)
    @legend = "Listado y Busqueda Proveedores"
  end


  

  # GET /suppliers/1
  # GET /suppliers/1.json
  def show
    @legend = "Datos del Proveedor"
    unless current_user.nil?
      if current_user.admin? 
      else 
        redirect_to root_path, notice: 'Debe ser administrador para poder manejar este menu' 
      end 
    end
  end

  # GET /suppliers/new
  def new
    unless current_user.nil?
      if current_user.admin? 
      else 
        redirect_to root_path, notice: 'Debe ser administrador para poder manejar este menu' 
      end 
    end
    @legend = "Nuevo Proveedor"
    @supplier = Supplier.new
  end

  # GET /suppliers/1/edit
  def edit
    unless current_user.nil?
      if current_user.admin? 
      else 
        redirect_to root_path, notice: 'Debe ser administrador para poder manejar este menu' 
      end 
    end
    @legend = "Editar Proveedor"
  end

  # POST /suppliers
  # POST /suppliers.json
  def create
    @legend = "Nuevo Proveedor"
    unless current_user.nil?
      if current_user.admin? 
      else 
        redirect_to root_path, notice: 'Debe ser administrador para poder manejar este menu' 
      end 
    end
    @supplier = Supplier.new(supplier_params)

    respond_to do |format|
      if @supplier.save
        format.html { redirect_to @supplier, notice: 'Proveedor creado con exito' }
        format.json { render :show, status: :created, location: @supplier }
      else
        format.html { render :new }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suppliers/1
  # PATCH/PUT /suppliers/1.json
  def update
    unless current_user.nil?
      if current_user.admin? 
      else 
        redirect_to root_path, notice: 'Debe ser administrador para poder manejar este menu' 
      end 
    end
    respond_to do |format|
      if @supplier.update(supplier_params)
        format.html { redirect_to @supplier, notice: 'Proveedor editado con exito' }
        format.json { render :show, status: :ok, location: @supplier }
      else
        format.html { render :edit }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suppliers/1
  # DELETE /suppliers/1.json
  def destroy
    unless current_user.nil?
      if current_user.admin? 
      else 
        redirect_to root_path, notice: 'Debe ser administrador para poder manejar este menu' 
      end 
    end
    @supplier.destroy
    respond_to do |format|
      format.html { redirect_to suppliers_url, notice: 'Proveedor eliminado con exito.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supplier_params
      params.require(:supplier).permit(:name)
    end

     def sort_column
      Supplier.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
