require "rails_helper"

RSpec.feature "Admins pueden eliminar cursos" do 
	scenario "con éxito" do 
		course = Course.create(name: "Matemáticas", description: "Es un curso de matemáticas básicas")
		visit "/"
		click_link "Matemáticas"
		click_link "Eliminar"
		expect(page).to have_content "El curso se ha eliminado."
        expect(page.current_url).to eq courses_url
        expect(page).to have_no_content "Matemáticas"
	end
end	

