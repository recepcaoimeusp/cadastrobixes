class EsporteBixosController < ApplicationController
 


 def index
  	
    @todo_o_hue = EsporteBixo.all


    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @todo_o_hue }
    end
  end


   # GET /esportes/new
  # GET /esportes/new.json
  def new
  	@bixo = Bixo.find(params[:bixo])
  	@esportes = Esporte.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @esportes }
    end
  end

  # GET /esportes/1
  # GET /esportes/1.json
  def show
  
    
  end

  # GET /esportes/1/edit
  def edit
  end

  

   # POST /esportes
  # POST /esportes.json
  def create
    @esportes = params[:esportes_ids]
    @bixo = Bixo.find(params[:bixo_id])

	EsporteBixo.where(:bixo_id => @bixo.id).destroy_all

    @esportes.each do |esporte|
    	@esporte_bixo = EsporteBixo.new
    	@esporte_bixo.bixo_id = @bixo.id
    	@esporte_bixo.esporte_id = esporte
    	@esporte_bixo.save
    end

    redirect_to bixos_path
    

#    respond_to do |format|
#      if @esporte.save
#        format.html { redirect_to @esporte, :notice => 'esporte was successfully created.' }
#        format.json { render :json => @esporte, :status => :created, :location => @esporte }
#      else
#        format.html { render :action => "new" }
#        format.json { render :json => @esporte.errors, :status => :unprocessable_entity }
#      end
#    end
   end

   # PUT /esportes/1
  # PUT /esportes/1.json
  def update
  end


  # DELETE /esportes/1
  # DELETE /esportes/1.json
  def destroy
  end

end