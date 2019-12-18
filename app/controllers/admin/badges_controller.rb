class Admin::BadgesController < Admin::BaseController

  before_action :find_picture, only: %i[create]
  before_action :set_badges, only: %i[index]
  before_action :set_badge, only: %i[edit update destroy]

  def index

  end

  def show

  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = @picture.create_badge(badge_params)

    if @badge.save
      redirect_to admin_badges_path, notice: t('.success')
    else
      render :new
    end
  end

  def edit

  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :rule)
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

end
