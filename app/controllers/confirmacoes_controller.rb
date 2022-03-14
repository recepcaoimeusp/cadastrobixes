class ConfirmacoesController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USER'], password: ENV['ADMIN_PASSWORD']

  def index
    @confirmed = Bixe.confirmed
    @non_confirmed = Bixe.non_confirmed
  end

  def create
    Confirmacao.create(bixe_id: params[:id]) if Bixe.find(params[:id])
    redirect_to confirmacoes_path, notice: 'Bixe confirmado'
  rescue ActiveRecord::RecordNotFound => exception
    redirect_to confirmacoes_path, alert: exception.message
  end
end
