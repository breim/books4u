class Professor < ActiveRecord::Base
  # Relations
  belongs_to :user

  # Validations
  # validates :email, format: {:with /\b[A-Z0-9._%a-z\-]+@kodak\.com\z/}, :allow_blank => false

  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@insper\.al.edu.br\z/ }, presence: true
end
