class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    # Dashboard için gerekli verileri buraya ekleyebilirsiniz
  end

  def profile
    @user = current_user
  end
end
