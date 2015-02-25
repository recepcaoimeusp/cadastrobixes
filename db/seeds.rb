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
  { modalidade: "Beisebol/Softbol" },
  { modalidade: "Futebol de campo" },
  { modalidade: "Futsal masculino" },
  { modalidade: "Futsal feminino" },
  { modalidade: "Handebol feminino" },
  { modalidade: "Handebol masculino" },
  { modalidade: "IMEteria" },
  { modalidade: "Judô" },
  { modalidade: "Rugby" },
  { modalidade: "Natação" },
  { modalidade: "Tênis" },
  { modalidade: "Tênis de mesa" },
  { modalidade: "Vôlei feminino" },
  { modalidade: "Vôlei masculino" },
  { modalidade: "Xadrez" }
].each do |esporte|
  Esporte.create(esporte)
end
