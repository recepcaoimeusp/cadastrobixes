class Confirmacao < ApplicationRecord
  belongs_to :bixe

  COLORS = [:PURPLE, :ORANGE, :GREEN, :BLUE, :GOLD].freeze


  def team_color
    COLORS[id % COLORS.length()].to_s.downcase
  end
end
