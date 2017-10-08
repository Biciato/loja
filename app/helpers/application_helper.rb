module ApplicationHelper
  def number_to_currency_br(number)
    number_to_currency(number, :unit => "R$ ", :separator => ",", :delimiter => ".")
  end

  def esconda_div_se(condicao, atributos = {}, &bloco)
    if condicao
      atributos["style"] = 'display: none'
    end
    content_tag('div', atributos, &bloco)
  end  
end
