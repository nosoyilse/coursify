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
	end

	def update
	end

	def destroy
	end

	private 
		def material_params
			params.require(:material).permit(:name, :description, :file)
		end
end
