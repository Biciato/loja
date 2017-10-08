class ProdutosChannel < ApplicationCable::Channel
  def subscribed
    stream_from "produtos"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
