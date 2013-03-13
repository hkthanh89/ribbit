class LikesController < ApplicationController

  def create
    @ribbit = Ribbit.find(params[:like][:ribbit_id])
    current_user.like!(@ribbit)
    redirect_to @ribbit
  end

  def destroy
    @ribbit = Like.find(params[:id]).ribbit
    current_user.unlike!(@ribbit)
    redirect_to @ribbit
  end
end
