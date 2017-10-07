require 'test_helper'

class ProdutoTest < ActiveSupport::TestCase
  test "produto attributes não deve ser vazio"do
    produto = Produto.new
    assert produto.invalid?
    assert produto.errors[:titulo].any?
    assert produto.errors[:preco].any?
    assert produto.errors[:image_url].any?
  end

  test "preço do produto deve ser positivo" do
    produto = Produto.new(titulo: "My book title",
                          image_url: "zzz.jpg")
    produto.preco = -1
    assert produto.invalid?
    assert_equal ["deve ser maior ou igual a 0.01"],
      produto.errors[:preco]

    produto.preco = 0
    assert produto.invalid?
    assert_equal ["deve ser maior ou igual a 0.01"],
      produto.errors[:preco]

    produto.preco = 1
    assert.valid?
  end

  def new_produto(image_url)
    Produto.new(titulo: "My book title",
                preco: 1,
                image_url: image_url)
  end

  test "image_url" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
                  http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }

    ok.each do |name|
      assert new_produto(name).valid?, "#{name} deve ser valido"
    end

    bad.each do |name|
      assert new_produto(name).invalid?, "#{name} deve ser invalido"
    end
  end
end
