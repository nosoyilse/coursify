class CoursesController < ApplicationController
	def index
		@courses = Course.all
	end

	def new
		@course = Course.new
	end

	def create
		@course = Course.new(course_params)
		if @course.save
			flash[:notice] = "Se ha creado el curso."
			redirect_to @course
		else
			flash[:error] = "No se ha creado el curso."
			render action: "new"
		end
	end

	def show
		@course = Course.find(params[:id])
	end

	def edit
		@course = Course.find(params[:id])
	end

	def update
		@course = Course.find(params[:id])
		if @course.update(course_params)
			flash[:notice] = "Se ha actualizado el curso."
			redirect_to @course
		else
			flash[:error] = "No se ha actualizado el curso."
			render action: "edit"
		end
	end

	def destroy
		@course = Course.find(params[:id])
		@course.destroy
		flash[:notice] = "El curso se ha eliminado."
		redirect_to courses_path
	end

	private
		def course_params
			params.require(:course).permit(:name, :description)
		end
end
