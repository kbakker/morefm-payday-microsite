class MainController < ApplicationController

  # GET /
  def index
    @entry = Entry.new
  end

end
