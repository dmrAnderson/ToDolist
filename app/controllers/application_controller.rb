# frozen_string_literal: true

class ApplicationController < ActionController::Base
  add_flash_types :light

  def back_with_flash(message)
    redirect_to :root, light: message
  end
end
