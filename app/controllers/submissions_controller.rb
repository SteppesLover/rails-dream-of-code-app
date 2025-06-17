class SubmissionsController < ApplicationController
  before_action :require_student, only: [:create]
  before_action :require_mentor, only: [:edit, :update]
  # GET /submissions/new
  def new
    @course = Course.find(params[:course_id])
    @submission = Submission.new
    @enrollments = @course.enrollments.includes(:student)
    @lessons = @course.lessons 
   end

  def create
    @course = Course.find(params[:course_id])
    @submission = Submission.new(submission_params)

    if @submission.save
      redirect_to course_path(@course), notice: 'Submission was successfully created.'
    else
      @enrollments # TODO: Set this up just as in the new action
      @lessons # TODO: Set this up just as in the new action
      render :new
    end
  end

  # GET /submissions/1/edit
  def edit
  end

  # PATCH/PUT /submissions/1 or /submissions/1.json
  def update
  end

   def require_student
    if current_user&.role != 'student'
    flash[:alert] = 'You do not have access to that page'
    redirect_to root_path
    end
  end
  def require_mentor
    if current_user&.role != 'mentor'
    flash[:alert] = 'You do not have access to that page'
    redirect_to root_path
    end

  private
    # Only allow a list of trusted parameters through.
  def submission_params
    params.require(:submission).permit(:lesson_id, :enrollment_id, :mentor_id, :review_result, :reviewed_at)
  end
  end
end
