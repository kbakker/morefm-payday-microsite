class EntriesController < ApplicationController

  # POST /entries
  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      render json: @entry, status: :ok
    else
      render json: @entry.errors.full_messages, status: :unprocessable_entity
    end
  end

private

  def entry_params
    params.require(:entry).permit(:number)
  end

end
