# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

[
  { modalidade: "Atletismo" },
  { modalidade: "Basquete feminino" },
  { modalidade: "Basquete masculino" },
  { modalidade: "Bridge/Cartas" },
  { modalidade: "Beisebol/Softbol" },
  { modalidade: "Futebol de campo" },
  { modalidade: "E-sports" },
  { modalidade: "Futsal masculino" },
  { modalidade: "Futsal feminino" },
  { modalidade: "Handebol feminino" },
  { modalidade: "Handebol masculino" },
  { modalidade: "Natação" },
  { modalidade: "Rugby" },
  { modalidade: "Saltos ornamentais" },
  { modalidade: "Tênis" },
  { modalidade: "Tênis de mesa" },
  { modalidade: "Ultimate" },
  { modalidade: "Vôlei feminino" },
  { modalidade: "Vôlei masculino" },
  { modalidade: "Xadrez" }
].each do |esporte|
  Esporte.create(esporte)
end
