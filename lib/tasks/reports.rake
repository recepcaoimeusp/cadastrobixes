namespace :reports do

  desc "Mostra relatório de vendas para os dias de matrícula. Só faz sentido se for rodado entre a matrícula e a semana de recepção"
  task :matricula => :environment do
    days = [
      Time.new(2015, 2, 11),
      Time.new(2015, 2, 12)
    ]
    acc = 0
    days.each do |day|
      stats = Venda.stats Venda.where(created_at: (day..day.end_of_day))
      puts "====== Dia #{day.strftime '%d/%m/%y'} ======"
      puts "Número de kits vendidos: #{stats[:vendas]} (#{stats[:quitados]} quitados)"
      puts "Valor total arrecadado: R$ #{stats[:total]}"
      puts "Quanto falta recebermos: R$ #{stats[:vendas]*Venda.preco - stats[:total]}"
      puts "Mochilas vermelhas: #{stats[:vermelhos]}"
      puts "Mochilas brancas: #{stats[:brancos]}"
      acc += stats[:total]
      puts "Balanço no final do dia: R$ #{acc - (200*Venda.custo).to_int}"
    end

    stats = Venda.stats
    puts "====== Total ======"
    puts "Número de kits vendidos: #{stats[:vendas]} (#{stats[:quitados]} quitados)"
    puts "Valor total arrecadado: R$ #{stats[:total]}"
    puts "Quanto falta recebermos: R$ #{stats[:vendas]*Venda.preco - stats[:total]}"
    puts "Mochilas vermelhas: #{stats[:vermelhos]}"
    puts "Mochilas brancas: #{stats[:brancos]}"
    puts "Balanço: R$ #{stats[:total] - (200*Venda.custo).to_int}"
  end

end
