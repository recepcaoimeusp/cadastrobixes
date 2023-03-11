class Bixe < ApplicationRecord
  validates :nome, presence: true
  validates :telefone, presence: true
  validates :email, presence: true
  validates :curso, presence: true

  has_and_belongs_to_many :modalidades
  has_and_belongs_to_many :items
  has_one :confirmacao

  enum curso: [:LIC, :PURA, :BCC, :ESTAT, :APLICADA, :BMAC, :LICNOTURNO].freeze

  delegate :team_color, to: :confirmacao

  def confirmed?
    confirmacao.present?
  end

  def self.confirmed
    all
      .select { |b| b.confirmed? }
      .sort_by { |b| [b.team_color] }
  end

  def self.non_confirmed
    all.select { |b| !b.confirmed? }
  end
end
