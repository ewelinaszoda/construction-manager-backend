class NotesController < ApplicationController

  def index
    notes= Note.all
    render json: @notes

  end

  def create
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
        # :project_id, 
      )
  end

end
