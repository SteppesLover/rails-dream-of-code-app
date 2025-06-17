class TrimestersController < ApplicationController
    before_action :require_admin, only: [:create, :update, :destroy]
    def index
      @trimesters = Trimester.all
    end

    def show
      @trimester = Trimester.find(params[:id])
    end


  # GET /trimester/1/edit
  def edit
    @trimester = Trimester.find_by(id: params[:id])
    if @trimester.nil?
      flash[:alert] = "Trimester not found"
      redirect_to trimesters_path
    end
  end

def update
  @trimester = Trimester.find_by(id: params[:id])

  if @trimester.nil?
    redirect_to trimesters_path, alert: "Trimester not found"
    return
  end

  respond_to do |format|
    if @trimester.update(trimester_params)
      format.html { redirect_to @trimester, notice: "Trimester was successfully updated." }
      format.json { render :show, status: :ok, location: @trimester }
    else
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @trimester.errors, status: :unprocessable_entity }
    end
  end
end
  def require_admin
    if current_user&.role != 'admin'
    flash[:alert] = 'You do not have access to that page'
    redirect_to root_path
  end

  private

  def trimester_params
    params.require(:trimester).permit(:application_deadline, :start_date, :end_date)
  end

end