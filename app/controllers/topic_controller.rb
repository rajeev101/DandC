class TopicController < ApplicationController
  def index
  end

  def create
  end

  def show
    @topic = Topic.find(params[:id])
  end
end
