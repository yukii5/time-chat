class AttendancesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

    def index
      @attendances = Attendance.all
    end
    
    
    def new
      @attendance = Attendance.new
    end
  
    def show
      @attendance = Attendance.find(params[:id])
    end
  
    def create  
      @attendance = Attendance.new(attendance_params)
      @attendance.user_id = current_user.id
      @attendance.save
      redirect_to attendances_path(@attendance)
    end
  
    def destroy
      @attendance = Attendance.find(params[:id])
      if @attendance.user != current_user
        redirect_to attendances_path, alert: "不正なアクセスです"
      else
        @attendance.destroy
        redirect_to attendances_path, notice:"削除しました"
      end
    end
  
    def edit
      @attendance = Attendance.find(params[:id])
      if @attendance.user != current_user
        redirect_to attendances_path, alert: "不正なアクセスです"
      end
      
    end
  
    def update
      @attendance = Attendance.find(params[:id])
      if @attendance.update(attendance_params)
        redirect_to attendances_path(@attendance), notice: "更新しました"
      else
        render 'edit'
      end
    end
  
    private
  
    def attendance_params
        params.require(:attendance).permit(:title, :content, :start_time, :last_time, :username)

    end
  
end
