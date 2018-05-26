require 'rails_helper'
RSpec.feature "Usuarios pueden ver cursos" do 
	scenario "ven detalles del curso" do 
		course = FactoryGirl.create(:course, name: "Matemáticas", description: "Es un curso de matemáticas básicas")
		visit "/"
		click_link "Matemáticas"
		expect(page.current_url).to eq course_url(course)
	end
end


