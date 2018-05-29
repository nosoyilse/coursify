class MaterialsController < ApplicationController
	before_action :set_course
	before_action :set_material, only: [:show, :edit, :update, :destroy]
	def index
	end

	def new
		@material = @course.materials.build
	end

	def create
		@material = @course.materials.build(material_params)
		if @material.save
			flash[:notice] = "Se ha guardado el archivo."
			redirect_to @course
		else
			render action: "new"
		end
	end

	def show
		@material = @course.materials.find(params[:id])
	end

	def edit
		@material = @course.materials.find(params[:id])
	end

	def update
		if @material.update(material_params)
			flash[:notice] = "Se ha actualizado el material."
			redirect_to [@course, @material]
		else
			render action: "edit"
		end
	end

	def destroy
		@material.destroy
		flash[:notice] = "El material se ha eliminado."
		redirect_to @course
	end

	private 
		def set_course
			@course = Course.find(params[:course_id])
		end
		def set_material
			@material = @course.materials.find(params[:id])
		end
		def material_params
			params.require(:material).permit(:name, :description, :file)
		end
end
