require 'sinatra'
require './lib/game'
require './lib/player'


class RPS < Sinatra::Base

  enable :sessions

  before do
    @game = Game.instance
  end

  get "/" do
    erb(:index)
  end

  post "/name" do
    player = Player.new(params[:player])

    @game = Game.create(player)
    redirect "/play"
  end
