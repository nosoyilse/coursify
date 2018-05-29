require 'rails_helper'

RSpec.feature "Admins pueden editar proyectos" do 
	scenario "con atributos válidos" do
		course = Course.create(name: "Matemáticas", description: "Es un curso de matemáticas básicas")
		visit "/"
		click_link "Matemáticas"
		click_link "Editar"
    	fill_in "Name", with: "Matemáticas Avanzadas"
    	click_button "Guardar"
		expect(page).to have_content "Se ha actualizado el curso."
		expect(page).to have_content "Matemáticas Avanzadas"
	end

	scenario "los atributos nos son válidos" do 
		course = Course.create(name: "Matemáticas", description: "Es un curso de matemáticas básicas")
		visit "/"
		click_link "Matemáticas"
		click_link "Editar"
    	fill_in "Name", with: ""
		click_button "Guardar"
		expect(page).to have_content "No se ha actualizado el curso."
	end
end
