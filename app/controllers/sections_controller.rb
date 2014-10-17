class SectionsController < ApplicationController
	include SectionsHelper

	def index

		student_leave
		@sections = Section.all
		@teacher = current_user
	    @sections = current_user.sections
	    @quizzes = current_user.quizzes
	end




	def show
		@section = Section.find(params[:id])
		logged_in?
		permission
	end

		

	def new
     	student_leave
		@teacher = current_user
	    @sections = current_user.sections
	    @quizzes = current_user.quizzes
	end


	def new
		@section = Section.new
	end


		      
    def confirm
    	@section = Section.find(params[:section_id])
    end

    def confirmed
    	@section = Section.find(params[:section_id])
    	if params[:passcode] = @section.passcode || 
    		Enrollment.create(section_id:@section.id,student_id:current_user.id)
    		redirect_to section_path(@section)
    	else
    		redirect_to sections_path
    	
		end

    end
		    
		

	def create
		@section = Section.new(section_params)
		if @section.save!
			redirect_to sections_path
		end
	end




	def edit
	    leave
	    @section = Section.find(params[:id])
	end

	def update
		@section = Section.find(params[:id])
		@section.update(section_params)
		if @section.save
			redirect_to sections_path
	    else
	    	render 'edit'
	    end
	end

	def destroy
		@section = Section.find(params[:id])
		 if @section.destroy
		 	redirect_to sections_path
		 else
		 	redirect_to sections_path
		 end
	end

	private
    def section_params
    	params.require(:section).permit(:name, :text)

    end
end
	

  


