class EsporteBixosController < ApplicationController
 


 def index
  	
    
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
  end


  # DELETE /esportes/1
  # DELETE /esportes/1.json
  def destroy
  end

end