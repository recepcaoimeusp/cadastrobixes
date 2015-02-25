class EsportesController < ApplicationController


	def index
  	@esportes = Esporte.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @esportes }
    end
  end


   # GET /esportes/new
  # GET /esportes/new.json
  def new
  	@esporte = Esporte.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @esporte }
    end
  end

  # GET /esportes/1
  # GET /esportes/1.json
  def show
  	@esporte = Esporte.find(params[:id])
  	@esporteBixos = EsporteBixo.find_all_by_esporte_id(@esporte.id)
  	@bixos = []
  	@hue = "lalalala"
  	@esporteBixos.each do |registro|
  		@bixos << Bixo.find(registro.bixo_id) 
  	end
    @bixos = @bixos.sort_by &:curso

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @esporte }
    end
  end

  # GET /esportes/1/edit
  def edit
    @esporte = Esporte.find(params[:id])
  end

  

   # POST /esportes
  # POST /esportes.json
  def create
    @esporte = Esporte.new(params[:esporte])

    respond_to do |format|
      if @esporte.save
        format.html { redirect_to @esporte, :notice => 'esporte was successfully created.' }
        format.json { render :json => @esporte, :status => :created, :location => @esporte }
      else
        format.html { render :action => "new" }
        format.json { render :json => @esporte.errors, :status => :unprocessable_entity }
      end
    end
   end

   # PUT /esportes/1
  # PUT /esportes/1.json
  def update
    @esporte = Esporte.find(params[:id])

    respond_to do |format|
      if @esporte.update_attributes(params[:esporte])
        format.html { redirect_to @esporte, :notice => 'esporte was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @esporte.errors, :status => :unprocessable_entity }
      end
    end
  end


  # DELETE /esportes/1
  # DELETE /esportes/1.json
  def destroy
    @esporte = Esporte.find(params[:id])
    @esporte.destroy

    respond_to do |format|
      format.html { redirect_to esportes_url }
      format.json { head :no_content }
    end
  end

end
