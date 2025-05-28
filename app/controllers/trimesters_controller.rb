class TrimestersController < ApplicationController
    def index
      @trimesters = Trimester.all
    end

    def show
      @trimester = Trimester.find(params[:id])
    end


  # GET /trimester/1/edit
  def edit
    @trimester = Trimester.find(params[:id])
  end
  def update
    @trimester = Trimester.find(params[:id])
    if @trimester.update(trimester_params)
      redirect_to @trimester, notice: "Trimester updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def trimester_params
    params.require(:trimester).permit(:application_deadline, :start_date, :end_date)
  end

end