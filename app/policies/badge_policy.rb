class BadgePolicy
  attr_reader :user, :badge

  def initialize(user, badge)
    @user = user
    @badge = badge
  end

  def approve?
    return false unless user # Kullanıcı yoksa false döndür
    user.roles.exists?(name: 'teacher') # Sadece öğretmenler onaylayabilir
  end

  # Herkes badge'leri görüntüleyebilir
  def show?
    true
  end
end


