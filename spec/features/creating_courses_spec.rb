require "rails_helper"

RSpec.feature "Admins can create projects" do 
	scenario "attributes are valid" do 
		visit "/"
		click_link "Nuevo Curso"
		fill_in "Name", with: "Matemáticas"
		fill_in "Description", with: "Es un curso de matemáticas básicas"
		click_button "Guardar"
		expect(page).to have_content "Se ha creado el curso."
	end

	scenario "los atributos nos son válidos" do 
		visit "/"
		click_link "Nuevo Curso"
		click_button "Guardar"
		expect(page).to have_content "No se ha creado el curso."
	end
end

