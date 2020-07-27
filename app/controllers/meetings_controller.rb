class MeetingsController < ApplicationController

  def index
    meetings= Meeting.all
    render json: @meetings
  end

  def create
  end

  def show
    @meeting = Meeting.find_by(meeting_params[:id])
    render json: @meeting
  end

  def my_meetings
    meetings = logged_in_user.meetings
    render json: meetings
  end 

  private

  def meeting_params
      params.require(:meeting).permit(
        :title, 
        :date, 
        :start_time,
        :end_time,
        :location,
        :description,
        # :project_id, 
      )
  end

end
