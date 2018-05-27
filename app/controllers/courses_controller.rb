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
	end

	def update
	end

	def destroy
	end

	private
		def course_params
			params.require(:course).permit(:name, :description)
		end
end
