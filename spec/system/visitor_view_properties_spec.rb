require 'rails_helper'

describe 'Visitor visit Home Page' do 
  it 'and view properties' do 
    #Arrange (Preparar os dados)
    Property.create({title:'Casa com quintal em Copabana', 
                  description:'Excelente casa, recém reformada com 2 vagas de garagem', 
                  rooms:3})
    Property.create({title:'Cobertura em Manaus', 
                  description:'Cobertura de 300m2, churrasqueira e sauna privativa', 
                  rooms:5})
    #Act (Agir, executar a funcionalidade)
    visit root_path

    #Assert(Garantir, que algo aconteça ou não)
    expect(page).to have_text("Casa com quintal em Copabana")
    expect(page).to have_text("Excelente casa, recém reformada com 2 vagas de garagem")
    expect(page).to have_text("Quartos: 3")
    expect(page).to have_text("Cobertura em Manaus")
    expect(page).to have_text("Cobertura de 300m2, churrasqueira e sauna privativa")
    expect(page).to have_text("Quartos: 5")
  end

  it 'and theres no property available' do
    visit root_path
    expect(page).to have_text("Nenhum imóvel disponível")
  end

  it 'and view property details' do 
    Property.create({title:'Casa com quintal em Copabana', 
                  description:'Excelente casa, recém reformada com 2 vagas de garagem', 
                  rooms:3, parking_slot: true, bathrooms:2, pets:true, daily_rate: 500})
    visit root_path
    click_on 'Casa com quintal em Copabana' 

    expect(page).to have_text("Casa com quintal em Copabana")
    expect(page).to have_text("Excelente casa, recém reformada com 2 vagas de garagem")
    expect(page).to have_text("Quartos: 3")
    expect(page).to have_text("Estacionamento: Sim")
    expect(page).to have_text("Banheiros: 2")
    expect(page).to have_text("Aceita Pets: Sim")
    expect(page).to have_text("Diária: R$ 500,00")

  end
end


