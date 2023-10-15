class SchedulesController < ApplicationController
    def index
        @schedules = Schedule.all
    end
    
    def new
        @schedule = Schedule.new
    end

    def create
        @schedule = Schedule.new(params.require(:schedule).permit(:title, :start_day, :end_day, :all_day))
        if @schedule.save
            flash[:notice] = "スケジュールを新規登録しました"
            redirect_to :schedules
        else
            render "new"
        end
    end
    
    def show
        @schedule = Schedule.find(params[:id])
    end

    def edit
    end

    def destroy
    end
end
