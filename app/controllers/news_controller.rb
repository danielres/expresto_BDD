class NewsController < ApplicationController
  load_and_authorize_resource

  def update
    respond_to do |format|
      format.json { render :json => @news } if @news.update_attributes!(params[:news])
    end
  end

end