class ChaptersController < ApplicationController
skip_before_action :authenticate_user!

  def index
    @finished_chapter = Chapter.where(finished: true).last_chapter
    @unfinished_chapter = Chapter.where(finished: false).last_chapter
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end
end
