class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :property_reservations
  # Tem muitas propriedades através das reservas
  has_many :properties, through: :property_reservations
  
end
