class StoryTemplatesController < ApplicationController
  def index
    stories = StoryTemplate.all
    render json: stories
  end

  def create
    new_story = StoryTemplate.new
    new_story.title = params[:title]
    new_story.narration = params[:narration]
    new_story.main_idea = params[:mainIdea]
    new_story.intro_desc = params[:introDesc]
    new_story.rising_action_desc = params[:risingActionDesc]
    new_story.climax_desc = params[:climaxDesc]
    new_story.conclusion_desc = params[:conclusionDesc]
    new_story.world_building = params[:worldBuilding]
    new_story.stage = 1
    # sequel = StoryTemplate.find_by_id(params[:sequelId])
    new_story.author_video_url = params[:authorVideoUrl]
    new_story.book_cover_url = params[:bookCoverUrl]
    new_story.genre = Genre.find_by_id params[:genreId]
    new_story.author = current_user
    if new_story.save
      render json: { created: true }, status: 201
    else
      render json: { created: false }, status: 400
    end
  end

  def show
    story = get_story params[:id]
    if story[:error]
      render json: story, status: 400
    elsif story[:story]
      story = story[:story]
      if story.author.id != current_user.id
        render json: { error: "No permission to view this story" }
      else
        render json: story
      end
    else
      render json: { error: "Story not found." }, status: 404
    end

  end

  def update
    story = get_story params[:id]
    if story[:error]
      render json: story, status: 400
    elsif story[:story]
      story = story[:story]
      if story.author.id != current_user.id
        return render json: { error: "No permission to edit this story" }
      end
      story.title = params[:title] unless params[:title].nil?
      story.narration = params[:narration] unless params[:narration].nil?
      story.main_idea = params[:mainIdea] unless params[:mainIdea].nil?
      story.intro_desc = params[:introDesc] unless params[:introDesc].nil?
      story.rising_action_desc = params[:risingActionDesc] unless params[:risingActionDesc].nil?
      story.climax_desc = params[:climaxDesc] unless params[:climaxDesc].nil?
      story.conclusion_desc = params[:conclusionDesc] unless params[:conclusionDesc].nil?
      story.world_building = params[:worldBuilding] unless params[:worldBuilding].nil?
      story.stage = params[:stage] unless params[:stage].nil?
      # sequel = StoryTemplate.find_by_id(params[:sequelId])
      story.author_video_url = params[:authorVideoUrl] unless params[:authorVideoUrl].nil?
      story.book_cover_url = params[:bookCoverUrl] unless params[:bookCoverUrl].nil?
      story.genre = Genre.find_by_id[params[:genreId]] unless params[:genreId].nil?
      if story.save
        head :no_content
      else
        render json: { error: "Failed to save story" }, status: 400
      end
    else
      render json: { error: "Story not found." }, status: 404
    end
  end

  def destroy
    story = get_story params[:id]
    if story[:error]
      render json: story, status: 400
    elsif story[:story]
      story = story[:story]
      if story.author.id != current_user.id
        return render json: { error: "No permission to delete this story" }
      end
      if story.destroy
        head :no_content
      else
        render json: { error: "Failed to delete story" }, status: 400
      end
    else
      render json: { error: "Story not found." }, status: 404
    end
  end

  private
  def get_story(story_template_id)
    handled_id = handle_id_param story_template_id
    if !handled_id[:valid]
      return handled_id[:json]
    end
    return { story: StoryTemplate.find_by_id(story_template_id) }
  end
end
