class VeteranosController < ApplicationController
  def index
    @veteranos = Veterano.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @veteranos }
    end
  end

  def new
    @veterano = Veterano.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @veterano }
    end
  end

  def edit
    @veterano = Veterano.find(params[:id])
  end

  def show
    @veterano = Veterano.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @veterano }
    end
  end

  # POST /veteranos
  # POST /veteranos.json
  def create
    @veterano = Veterano.new(params[:veterano])

    respond_to do |format|
      if @veterano.save
        format.html {
          redirect_to @veterano,
          :notice => 'veterano was successfully created.'
        }
        format.json {
          render :json => @veterano,
          :status => :created, :location => @veterano
        }
      else
        format.html { render :action => "new" }
        format.json {
          render :json => @veterano.errors,
          :status => :unprocessable_entity
        }
      end
    end
   end

  # PUT /veteranos/1
  # PUT /veteranos/1.json
  def update
    @veterano = Veterano.find(params[:id])

    respond_to do |format|
      if @veterano.update_attributes(params[:veterano])
        format.html {
          redirect_to @veterano,
          :notice => 'veterano was successfully updated.'
        }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json {
          render :json => @veterano.errors,
          :status => :unprocessable_entity
        }
      end
    end
  end

  # DELETE /veteranos/1
  # DELETE /veteranos/1.json
  def destroy
    @veterano = Veterano.find(params[:id])
    @veterano.destroy

    respond_to do |format|
      format.html { redirect_to veteranos_url }
      format.json { head :no_content }
    end
  end

end
