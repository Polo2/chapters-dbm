class ChaptersController < ApplicationController
skip_before_action :authenticate_user!

  def index
    @chapters = Chapter.all
    @last_chapter = @chapters.last
    @pages = @last_chapter.dbm_pages.sort_by{ |p| p.number }
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
