class AnimalsController < ApplicationController
  before_action :set_type
  before_action :set_animal, only: [:show, :edit, :update, :destroy]

  def index
    @animals = type_class.all
    render json: @animals.map {|animal| {name: animal.name, type: animal.type}}
  end

  def show
    render json: {name: @animal.name, type: @animal.type}
  end

  def new
    @animal = type_class.new
    render json: {name: @animal.name, type: @animal.type}
  end

  def create
    @animal = type_class.new(animal_params)
    render json: {name: @animal.name, type: @animal.type}
  end

  def edit
    render json: {name: @animal.name, type: @animal.type}
  end

  def update
    @animal.update(animal_params)
    render json: {name: @animal.name, type: @animal.type}
  end

  def destroy
    @animal.destroy
    render json: {status: :deleted}
  end

  private
    def set_type
      @type = Animal.types.include?(params[:type]) ? params[:type] : 'Animal'
    end

    def type_class
      @type.constantize
    end

    def animal_params
      params.permit(:name)
    end

    def set_animal
      @animal = type_class.find(params.permit(:id)[:id])
    end
end