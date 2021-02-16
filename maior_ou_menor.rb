# frozen_string_literal: true

def da_boas_vindas
  puts 'Bem vindo ao jogo da adivinhação'
  puts 'Qual é o seu nome?'
  nome = gets.strip
  puts "\n\n\n"
  puts "Começaremos o jogo para você, #{nome}"
end

def escolhe_numero_secreto
  puts 'Escolhendo um número secreto entre 0 e 200...'
  sorteado = rand(201)
  puts 'Escolhido... que tal adivinhar hoje nosso número secreto?'
  sorteado
end

def pede_um_numero(tentativa, limite_de_tentativas, chutes)
  puts "\n\n"
  puts "Tentativa #{tentativa} de #{limite_de_tentativas}"
  puts "Chutes até agora: #{chutes}"
  puts 'Entre com o número'
  chute = gets.strip
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
pontos_ate_agora = 1000
chutes = []

limite_de_tentativas = 5

for tentativa in 1..limite_de_tentativas
  chute = pede_um_numero tentativa, limite_de_tentativas, chutes

  chutes << chute

  pontos_a_perder = (chute - numero_secreto).abs / 2.0
  pontos_ate_agora -= pontos_a_perder

  break if verifica_se_acertou numero_secreto, chute

  puts "O número secreto era #{numero_secreto}." if tentativa == limite_de_tentativas
end

puts "Você ganhou #{pontos_ate_agora} pontos."
