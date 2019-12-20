class Admin::BadgesController < Admin::BaseController

  before_action :find_picture, :find_rule, only: %i[create]
  before_action :set_badges, only: %i[index]
  before_action :set_badge, only: %i[destroy]

  def index

  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)
    @picture.badges.push @badge
    @rule.badges.push @badge
    if @badge.save
      redirect_to admin_badges_path, notice: t('.success')
    else
      render :new
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :option)
  end

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def set_badges
    @badges = Badge.all
  end

  def find_picture
    @picture = Picture.find(params[:badge][:picture_id])
  end

  def find_rule
    @rule = Rule.find(params[:badge][:rule_id])
  end

end
