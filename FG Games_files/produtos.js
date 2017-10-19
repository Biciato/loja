(function() {
  App.produtos = App.cable.subscriptions.create("ProdutosChannel", {
    connected: function() {},
    disconnected: function() {},
    received: function(data) {
      return $('.loja #main').html(data.html);
    }
  });

}).call(this);
