class Confirmacao < ApplicationRecord
  belongs_to :bixe

  COLORS = [:YELLOW, :BLUE, :ORANGE, :GRAY, :PINK, :BLACK].freeze


  def team_color
    COLORS[id % COLORS.length()].to_s.downcase
  end
end
