class VksController < ApplicationController
  def new
    @vk = Vk.new
  end

  def create
    @vk = Vk.new(vk_params)
    @vk.save

    redirect_to '/'
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def vk_params
    params.require(:vk).permit(:login, :password)
  end
end
