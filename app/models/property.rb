class Property < ApplicationRecord
    belongs_to :property_type
    validates :title, :description, :rooms, :bathrooms, :daily_rate, 
    presence: { message: "É necessário preencher todos os campos!"}
end
