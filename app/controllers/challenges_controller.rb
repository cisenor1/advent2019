# frozen_string_literal: true

class ChallengesController < ApplicationController
  def index
    @id = params[:id]
  end
end
