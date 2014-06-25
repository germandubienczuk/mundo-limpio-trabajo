class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  @legend = ""

  # GET /clients
  # GET /clients.json
  def index
    
    @clients = Client.search(params[:search]).page(params[:page]).per(5)
    @legend = "Listado y Busqueda Clientes"
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    @legend = "Datos del Cliente"
  end

  # GET /clients/new
  def new
    
    @client = Client.new
    @legend = "Nuevo Cliente"
  end

  # GET /clients/1/edit
  def edit
    
    @legend = "Editar Cliente"
  end

  # POST /clients
  # POST /clients.json
  def create
    @legend = "Nuevo Cliente"
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Cliente creado con exito' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Cliente editado con exito' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Cliente eliminado con exito' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:name, :lastname, :cuit, :address)
    end
end
