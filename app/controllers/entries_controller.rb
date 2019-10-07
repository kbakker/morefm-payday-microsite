class EntriesController < ApplicationController
  # Skip CSRF
  skip_before_action :verify_authenticity_token

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
    params.require(:entry).permit(:number, :email)
  end

end
