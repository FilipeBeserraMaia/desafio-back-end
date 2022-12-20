class MunicipesController < ApplicationController
  before_action :set_municipe, only: %i[ show edit update destroy ]

  # GET /municipes or /municipes.json
  def index
    set_municipes()
  end

  # GET /municipes/1 or /municipes/1.json
  def show
  end

  # GET /municipes/new
  def new
    @municipe = Municipe.new
  end

  # GET /municipes/1/edit
  def edit
    @municipe.build_endereco unless @municipe.endereco.present?
  end

  # POST /municipes or /municipes.json
  def create
    @municipe = Municipe.new(municipe_params)

    respond_to do |format|
      if @municipe.save
        set_municipes()
        format.html { redirect_to municipe_url(@municipe), notice: "Municipe was successfully created." }
        format.js { render 'municipes/create', notice: "Municipe was successfully created." }
        format.json { render :show, status: :created, location: @municipe }
      else
        @municipe.build_endereco if @municipe.endereco.blank?
        format.html { render :new, status: :unprocessable_entity }
        format.js { render 'municipes/create', status: :unprocessable_entity }
        format.json { render json: @municipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /municipes/1 or /municipes/1.json
  def update
    respond_to do |format|
      if @municipe.update(municipe_params)
        set_municipes()
        format.html { redirect_to municipe_url(@municipe), notice: "Municipe was successfully updated." }
        format.js { render 'municipes/update', notice: "Municipe was successfully updated." }
        format.json { render :show, status: :ok, location: @municipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.js { render 'municipes/update', status: :unprocessable_entity }
        format.json { render json: @municipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /municipes/1 or /municipes/1.json
  def destroy
    @municipe.destroy

    respond_to do |format|
      format.html { redirect_to municipes_url, notice: "Municipe was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_municipes()
    @municipes = Municipe.eager_load(:endereco).order(created_at: :asc)
  end

  def set_municipe()
    @municipe = Municipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def municipe_params
    params.require(:municipe).permit(:nome, :cpf, :cns, :email, :dta_nasc, :telefone, :status, :foto,
                                     endereco_attributes: [:id, :cep, :longr, :complemento, :bairro, :cidade, :uf, :cdg_ibge, :municipe_id])
  end
end
