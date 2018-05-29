require "rails_helper"

RSpec.feature "Admins pueden crear materiales dentro de cursos" do 
	scenario "con atributos válidos" do
		course = Course.create(name: "Matemáticas", description: "Es un curso de matemáticas básicas") 
		visit "/"
		click_link "Matemáticas"
		click_link "Añadir material"
		fill_in "Name", with: "Presentación PPT, Pitágoras"
		fill_in "Description", with: "Presentación de la primera clase"
		fill_in "File", with: "www.drive.com/file"
		click_button "Guardar"
		expect(page).to have_content "Se ha guardado el archivo."
	end
	scenario "los atributos nos son válidos" do 
		course = Course.create(name: "Matemáticas", description: "Es un curso de matemáticas básicas")
		visit "/"
		click_link "Matemáticas"
		click_link "Añadir material"	
    	fill_in "Name", with: ""
		click_button "Guardar"
		expect(page).to have_content "No se ha guardado el material."
	end
end

