class StoryChaptersController < ApplicationController
  def index
    story_template_id = params[:story_template_id]
    handled_id = handle_id_param story_template_id
    if handled_id[:valid]
      chapters = StoryChapter.where(story_template_id: story_template_id)
      render json: chapters
    else
      render json: handled_id[:json]
    end
  end

  def create
    chapter = StoryChapter.new(title: params[:title], summary: params[:summary])
    story = StoryTemplate.find_by_id(params[:story_template_id])
    chapter.story_template = story
    chapter.chapter_num = story.chapters.count + 1
    if chapter.save
      render json: { created: true }, status: 201
    else
      render json: { created: false }, status: 400
    end
  end

  def show
    story_template_id = params[:story_template_id]
    chapter_id = params[:id]
    chapter = StoryChapter.find_by_id(chapter_id)
    if chapter && chapter.story_template.id.to_s == story_template_id
      render json: chapter
    else
      render json: { error: "Chapter for story not found" }
    end
  end

  def update
    story_template_id = params[:story_template_id]
    chapter_id = params[:id]
    chapter = StoryChapter.find_by_id(chapter_id)
    if chapter && chapter.story_template.id.to_s == story_template_id
      chapter.title = params[:title] unless params[:title].nil?
      chapter.summary = params[:summary] unless params[:summary].nil?
      if chapter.save
        head :no_content
      else
        render json: { error: "Unable to save chapter" }, status: 400
      end
    else
      render json: { error: "Chapter for story not found" }
    end
  end

  def destroy #TODO may need to decrement subsequent chapters
    story_template_id = params[:story_template_id]
    chapter_id = params[:id]
    chapter = StoryChapter.find_by_id(chapter_id)
    if chapter && chapter.story_template.id.to_s == story_template_id
      if chapter.destroy
        head :no_content
      else
        render json: { error: "Unable to delete chapter" }, status: 400
      end
    else
      render json: { error: "Chapter for story not found" }
    end
  end
end
