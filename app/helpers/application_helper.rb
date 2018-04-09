module ApplicationHelper

  # hide the div tag if it has no product to show
  def esconda_div_se(condicao, atributos = {}, &bloco)
    if condicao
      atributos["style"] = 'display: none'
    end
    content_tag('div', atributos, &bloco)
  end
end
