require 'rails_helper'

RSpec.feature "Admins pueden editar materiales" do 
	scenario "con atributos válidos" do
		course = Course.create(name: "Matemáticas", description: "Es un curso de matemáticas básicas")
		material = Material.create(name: "Presentación PPT, Pitágoras", description: "Presentación de la primera clase", file: "www.drive.com/file", course_id: course.id)
		visit "/"
		click_link "Matemáticas"
		click_link "Presentación PPT, Pitágoras"
		click_link "Editar"
    	fill_in "Name", with: "Presentación PPT"
    	click_button "Guardar"
		expect(page).to have_content "Se ha actualizado el material."
		expect(page).to have_content "Presentación PPT"
	end

	scenario "los atributos nos son válidos" do 
		course = Course.create(name: "Matemáticas", description: "Es un curso de matemáticas básicas")
		material = Material.create(name: "Presentación PPT, Pitágoras", description: "Presentación de la primera clase", file: "www.drive.com/file", course_id: course.id)
		visit "/"
		click_link "Matemáticas"
		click_link "Presentación PPT, Pitágoras"	
		click_link "Editar"
    	fill_in "Name", with: ""
		click_button "Guardar"
		expect(page).to have_content "No se ha actualizado el material."
	end
end
