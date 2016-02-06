class HomeController < ApplicationController
  def index
    @stats = Venda.stats
    last = Venda.order(bixo_id: :asc).last
    if last then
      @ultima = last.hora
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @stats }
    end
  end
end
