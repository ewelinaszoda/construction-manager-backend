class NotesController < ApplicationController

  def index
    notes= Note.all
    render json: @notes

  end

  def create

    note = Note.create(
      project_id: params[:project_id],
      title: params[:title],
      description: params[:description],
      )

    #     byebug

#  follow implementation from meeting controller
  end

  def show
    @note = Note.find_by(note_params[:id])
    render json: @note
  end

  private

  def note_params
      params.require(:note).permit(
        :title, 
        :description,
        :project_id, 
      )
  end

end
