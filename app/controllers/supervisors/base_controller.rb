# frozen_string_literal: true
module Supervisors
  class BaseController < ApplicationController

    before_action :must_be_supervisor
    before_action :authenticate_user!
    helper_method :supervised_teams

    protected

    def must_be_supervisor
      unless current_user&.supervisor?
        redirect_to root_path, alert: 'Sorry, the dashboard is for supervisors only'
      end
    end

    def supervised_teams
      @supervised_teams = current_user.teams.where(roles: { name: 'supervisor' }, season_id: Season.current.id)
    end
  end
end
