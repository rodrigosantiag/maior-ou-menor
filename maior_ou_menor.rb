# frozen_string_literal: true

def da_boas_vindas
  puts 'Bem vindo ao jogo da adivinhação'
  puts 'Qual é o seu nome?'
  nome = gets
  puts "\n\n\n"
  puts "Começaremos o jogo para você, #{nome}"
end

def escolhe_numero_secreto
  puts 'Escolhendo um número secreto entre 0 e 200...'
  sorteado = 175
  puts 'Escolhido... que tal adivinhar hoje nosso número secreto?'
  sorteado
end

def pede_um_numero(tentativa, limite_de_tentativas)
  puts "\n\n"
  puts "Tentativa #{tentativa} de #{limite_de_tentativas}"
  puts 'Entre com o número'
  chute = gets
  puts "Será que acertou? Você chutou #{chute}"
  chute.to_i
end

def verifica_se_acertou(numero_secreto, chute)
  acertou = chute == numero_secreto

  if acertou
    puts 'Acertou!'
    return true
  end
  maior = numero_secreto > chute
  puts maior ? 'Número escolhido é maior' : 'Número escolhido é menor'
  false
end

da_boas_vindas
numero_secreto = escolhe_numero_secreto

limite_de_tentativas = 5

for tentativa in 1..limite_de_tentativas
  chute = pede_um_numero tentativa, limite_de_tentativas

  break if verifica_se_acertou numero_secreto, chute
end
