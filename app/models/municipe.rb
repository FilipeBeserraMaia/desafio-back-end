class Municipe < ApplicationRecord
  has_one :endereco, dependent: :destroy
  accepts_nested_attributes_for :endereco, reject_if: :all_blank

  validates_presence_of :nome, :cpf, :cns, :email, :dta_nasc, :telefone, :status

  validates_length_of :nome, minimum: 1, maximum: 80
  validates_length_of :cpf, minimum: 11, maximum: 11
  validates_length_of :cns, minimum: 15, maximum: 15
  validates_length_of :email, minimum: 1, maximum: 256
  validates_length_of :telefone, minimum: 13, maximum: 13

  enum status: { inactive: 0, active: 1 }

end
