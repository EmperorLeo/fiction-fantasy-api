class CharacterArchetypesController < ApplicationController
  def index
    render json: CharacterArchetype.all
  end

  def show
    id = params[:id]
    if !id
      render json: { error: "Missing id" }, status: 400
    elsif !id.is_number?
      render json: { error: "Id is not a number" }, status: 400
    else
      @archetype = CharacterArchetype.find_by_id(params[:id])
      if @archetype.nil?
        render json: { error: "Id is invalid" }
      else
        render json: @archetype
      end
    end
  end
end
