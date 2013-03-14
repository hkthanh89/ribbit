class LikesController < ApplicationController

  # respond_to :html, :js

  def create
    @ribbit = Ribbit.find(params[:like][:ribbit_id])
    current_user.like!(@ribbit)

    respond_to do |format|
      format.html { redirect_to ribbits_url }
      format.js
    end
    # respond_with(@ribbit, location: ribbits_url)
  end

  def destroy
    @ribbit = Like.find(params[:id]).ribbit
    current_user.unlike!(@ribbit)

    respond_to do |format|
      format.html { redirect_to ribbits_url }
      format.js
    end
    # respond_with(@ribbit, location: ribbits_url)
  end
end
