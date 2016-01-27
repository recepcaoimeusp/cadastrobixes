namespace :reports do

  desc "Mostra relatório de vendas para os dias de matrícula. Só faz sentido se for rodado entre a matrícula e a semana de recepção"
  task :matricula => :environment do
    days = [
      Time.new(2015, 2, 11),
      Time.new(2015, 2, 12),
      Time.new(2015, 2, 23),
      Time.new(2015, 2, 24),
      Time.new(2015, 2, 25),
      Time.new(2015, 2, 26),
      Time.new(2015, 2, 27),
    ]
    acc = 0
    days.each do |day|
      stats = Venda.stats(day..day.end_of_day)
      puts "====== Dia #{day.strftime '%d/%m/%y'} ======"
      puts "Número de kits vendidos: #{stats[:vendas]} (#{stats[:quitados]} quitados)"
      puts "Valor total arrecadado: R$ #{stats[:total]}"
      puts "Mochilas vermelhas: #{stats[:vermelhos]}"
      puts "Mochilas brancas: #{stats[:brancos]}"
      puts "Camisetas P: #{stats[:camisetas]['P']}"
      puts "Camisetas M: #{stats[:camisetas]['M']}"
      puts "Camisetas G: #{stats[:camisetas]['G']}"
      puts "Camisetas GG: #{stats[:camisetas]['GG']}"
      puts "Camisetas Baby G: #{stats[:camisetas]['Baby G']}"
      acc += stats[:total]
      puts "Balanço no final do dia: R$ #{acc - (200*Venda.custo).to_int}"
    end

    stats = Venda.stats
    puts "====== Total ======"
    puts "Número de kits vendidos: #{stats[:vendas]} (#{stats[:quitados]} quitados)"
    puts "Valor total arrecadado: R$ #{stats[:total]}"
    puts "Mochilas vermelhas: #{stats[:vermelhos]}"
    puts "Mochilas brancas: #{stats[:brancos]}"
    puts "Camisetas P: #{stats[:camisetas]['P']}"
    puts "Camisetas M: #{stats[:camisetas]['M']}"
    puts "Camisetas G: #{stats[:camisetas]['G']}"
    puts "Camisetas GG: #{stats[:camisetas]['GG']}"
    puts "Camisetas Baby G: #{stats[:camisetas]['Baby G']}"
    puts "Balanço: R$ #{stats[:total] - (200*Venda.custo).to_int}"
  end

  desc "Mostra inadimplentes"
  task :inadimplentes => :environment do
    Venda.all.each do |venda|
      unless venda.completo?
        puts "========================================"
        puts "Inadimplente: #{venda.bixo.nome}"
        puts "E-mail: #{venda.bixo.email}"
        puts "Telefone: #{venda.bixo.telefone}"
        puts "Curso: #{venda.bixo.curso}"
        puts "Valor que deve: #{Venda.preco - venda.valor}"
      end
    end
  end

  desc "Mostra os e-mails dos bixes em cada modalidade da atlética"
  task :atletica_email => :environment do
    Esporte.all.each do |esporte|
      puts "====== #{esporte.modalidade} ======"
      esporte.esporte_bixos.each do |rel|
        puts rel.bixo.email
      end
    end
  end

  desc "Mostra os telefones dos bixes em cada modalidade da atlética"
  task :atletica_tel => :environment do
    Esporte.all.each do |esporte|
      puts "====== #{esporte.modalidade} ======"
      esporte.esporte_bixos.each do |rel|
        puts "#{rel.bixo.nome} : #{rel.bixo.telefone}"
      end
    end
  end

end
