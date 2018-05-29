require "rails_helper"

RSpec.feature "Admins pueden eliminar cursos" do 
	scenario "con éxito" do 
		course = Course.create(name: "Matemáticas", description: "Es un curso de matemáticas básicas")
		material = Material.create(name: "Presentación PPT, Pitágoras", description: "Presentación de la primera clase", file: "www.drive.com/file", course_id: course.id)
		visit "/"
		click_link "Matemáticas"
		click_link "Presentación PPT, Pitágoras"
		click_link "Eliminar"
		expect(page).to have_content "El material se ha eliminado."
        expect(page.current_url).to eq course_url(course)
        expect(page).to have_no_content "Presentación PPT, Pitágoras"
	end
end	

