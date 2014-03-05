class Bitcoin::Client

  def decoderawtransaction hexstring
    @api.request 'decoderawtransaction', hexstring
  end

  def getrawtransaction txid
    raw_tx = @api.request 'getrawtransaction', txid
    decoderawtransaction raw_tx
  end

  alias raw_transaction getrawtransaction
end

$bitcoin_client = Bitcoin::Client.new ENV['RPC_USER'], ENV['RPC_PASS'], port: ENV['RPC_PORT']

