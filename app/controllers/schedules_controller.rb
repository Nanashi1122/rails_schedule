class SchedulesController < ApplicationController
    def index
        @schedules = Schedule.all
    end
    
    def new
        @schedule = Schedule.new
    end

    def create
        @schedule = Schedule.new(params.require(:schedule).permit(:title, :start_day, :end_day, :all_day, :memo))
        if @schedule.save
            flash[:notice] = "スケジュールを新規登録しました"
            redirect_to :schedules
        else
            flash[:notice_N] = "スケジュールの作成に失敗しました"
            render "new"
        end
    end
    
    def show
        @schedule = Schedule.find(params[:id])
    end

    def edit
        @schedule = Schedule.find(params[:id])
    end

    def update
        @schedule = Schedule.find(params[:id])
        if @schedule.update(params.require(:schedule).permit(:title, :start_day, :end_day, :all_day, :memo))
            flash[:notice] = "スケジュールを更新しました"
            redirect_to :schedules
        else
            flash[:notice_N] = "スケジュールの更新に失敗しました"
            render "edit"
        end
    end

    def destroy
        @schedule = Schedule.find(params[:id])
        @schedule.destroy
        flash[:notice] = "スケジュールを削除しました"
        redirect_to :schedules
    end
end
