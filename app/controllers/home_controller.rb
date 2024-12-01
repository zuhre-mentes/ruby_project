class HomeController < ApplicationController
  before_action :require_login # Kullanıcının giriş yapıp yapmadığını kontrol eder

  def index
    # Ana sayfa için içerik
  end
end