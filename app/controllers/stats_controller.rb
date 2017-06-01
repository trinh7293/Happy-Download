class StatsController < ApplicationController
  def index
    @supports = Supports::Stat.new
  end
end
