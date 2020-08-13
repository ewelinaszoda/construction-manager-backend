class MeetingsController < ApplicationController

  def index
    meetings= Meeting.all
    render json: meetings
  end

  def create

    meeting = Meeting.create(

      project_id: params[:project_id],
      title: params[:title],
      date: params[:date], 
      start_time: params[:start_time], 
      end_time: params[:end_time], 
      location: params[:location],
      description: params[:description],
      )

    #     byebug

    #     meeting_project = Meeting.find_by(meeting_params[:project_id])
    #     meeting_project_user_id =  meeting_project.user_id

    #   if  meeting_project_user_id == logged_in_user.id
    #     render json: meeting
    #   else 
    #     render json: { error: meeting.errors.full_messages}
    # end 

  end

  def show
    meeting = Meeting.find_by(meeting_params[:id])
    render json: meeting
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
        :project_id, 
      )
  end

end
