require 'sinatra'
require 'sinatra/reloader' if development?

require './config/init'

use Sass::Plugin::Rack

set :haml, layout: true, format: :html5



get '/tx/:tx.json' do
  @tx = Tx.find params[:tx]
  JSON.dump(@tx.raw)
end
get '/tx/:tx' do
  @tx = Tx.find params[:tx]
  haml :tx
end



helpers do

  def render_btc satoshis
    btc = satoshis * 0.00000001
    '%.8f BTC' % [btc]
  end

end

