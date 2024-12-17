class HeroesController < ApplicationController
  before_action :set_hero, only: %i[show edit update destroy]

  def index
    @heroes = Hero.all
  end

  def show
  end

  def new
    @hero = Hero.new
  end

  def create
    @hero = Hero.new(hero_params)
    if @hero.save
      redirect_to @hero, notice: 'Hero created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @hero.update(hero_params)
      redirect_to heroes_path, notice: 'Hero updated'
    else
      render :edit
    end
  end

  def destroy
    @hero.destroy
    redirect_to heroes_path, notice: 'Hero deleted'
  end

  private

  def set_hero
    @hero = Hero.find(params[:id])
  end

  def hero_params
    params.require(:hero).permit(:name, :health, :attack_power, :image)
  end
end
