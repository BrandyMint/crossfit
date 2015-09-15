class UserDecorator < Draper::Decorator
  include Gravatarify::Helper
  delegate_all

  def avatar
    gravatar_tag source
  end
end
