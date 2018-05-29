class MaterialsController < ApplicationController
	def index
	end

	def new
		@course = Course.find(params[:course_id])
		@material = @course.materials.build
	end

	def create
		@course = Course.find(params[:course_id])
		@material = @course.materials.build(material_params)
		if @material.save
			flash[:notice] = "Se ha guardado el archivo."
			redirect_to @course
		else
			render action: "new"
		end
	end

	def show
		@course = Course.find(params[:course_id])
		@material = @course.materials.find(params[:id])
	end

	def edit
		@course = Course.find(params[:course_id])
		@material = @course.materials.find(params[:id])
	end

	def update
		@course = Course.find(params[:course_id])
		@material = @course.materials.find(params[:id])
		if @material.update(material_params)
			flash[:notice] = "Se ha actualizado el material."
			redirect_to [@course, @material]
		else
			render action: "edit"
		end
	end

	def destroy
		@course = Course.find(params[:course_id])
		@material = @course.materials.find(params[:id])
		@material.destroy
		flash[:notice] = "El material se ha eliminado."
		redirect_to @course
	end

	private 
		def material_params
			params.require(:material).permit(:name, :description, :file)
		end
end
