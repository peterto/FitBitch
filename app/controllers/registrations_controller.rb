class RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def create
    super
  end

  def update
    super
  end

  def fitbit

  end

  private
  def after_sign_up_path_for(resource)
    users_fitbit_path
  end
end