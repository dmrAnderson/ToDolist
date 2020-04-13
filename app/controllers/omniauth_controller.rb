# frozen_string_literal: true

# comment
class OmniauthController < ApplicationController
  def google_oauth2
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user
    else
      redirect_to new_user_registration_url,
                  light: 'There was a problem signing you in through Google.'
    end
  end

  def failer
    redirect_to new_user_registration_url,
                light: 'There was a problem signing you in.'
  end
end
