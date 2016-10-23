class CharacterArchetypesController < ApplicationController
  def index
    render json: CharacterArchetype.all
  end

  def show
    id = params[:id]
    valid_id = handle_id_param id
    if !valid_id[:valid]
      render json: valid_id[:json], status: 400
    else
      @archetype = CharacterArchetype.find_by_id(params[:id])
      if @archetype.nil?
        render json: { error: "Not found" }, status: 404
      else
        render json: @archetype
      end
    end
  end
end
