class RibbitsController < ApplicationController

  def index
    @ribbits = Ribbit.all include: :user
    @ribbit = Ribbit.new
  end

  def create
    @ribbit = Ribbit.new(params[:ribbit])
    @ribbit.user_id = current_user.id
    if @ribbit.save
      redirect_to current_user
    else
      flash[:error] = "Problem!"
      redirect_to current_user
    end
  end

  def show
    @ribbit = Ribbit.find(params[:id])
  end

  def like
    @ribbit =  Ribbit.find(params[:id])
    current_user.like!(@ribbit)

    redirect_to ribbits_url
  end

  def unlike
    @ribbit = Ribbit.find(params[:id])
    current_user.unlike!(@ribbit)
    
    redirect_to ribbits_url
  end
end
