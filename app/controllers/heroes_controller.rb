# frozen_string_literal: true

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

  def battle
    validation_result = validate_heroes_selection

    if validation_result[:error]
      flash[:error] = validation_result[:error]
      redirect_to heroes_path and return
    end

    @results = ::BattleService.new(@hero1, @hero2).call
    ::CreateHistoryService.new(@hero1, @hero2, @results[:winner]).call

    render :battle_result
  end

  def add_weapon
    @hero = Hero.find(params[:id])
    @weapon = Weapon.find(params[:weapon_id])

    @hero.weapons << @weapon unless @hero.weapons.include?(@weapon)

    redirect_to @hero, notice: 'Weapon added successfully!'
  end

  private

  def validate_heroes_selection
    if params[:hero1_id].blank? || params[:hero2_id].blank?
      return { error: 'You must select one hero for each player.' }
    end

    @hero1 = Hero.find_by(id: params[:hero1_id])
    @hero2 = Hero.find_by(id: params[:hero2_id])

    return { error: 'Invalid hero selection. Please try again.' } if @hero1.nil? || @hero2.nil?

    { error: nil }
  end

  def set_hero
    @hero = Hero.find(params[:id])

  rescue ActiveRecord::RecordNotFound
    redirect_to heroes_path
  end

  def hero_params
    params.require(:hero).permit(:name, :health, :attack_power, :image, :crit, :accuraty)
  end
end
