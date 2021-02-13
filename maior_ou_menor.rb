# frozen_string_literal: true

puts 'Bem vindo ao jogo da adivinhação'

puts 'Qual é o seu nome?'
nome = gets

puts "\n\n\n"

puts "Começaremos o jogo para você, #{nome}"

puts 'Escolhendo um número secreto entre 0 e 200...'
puts 'Escolhido... que tal adivinhar hoje nosso número secreto?'
numero_secreto = 175

limite_de_tentativas = 5

for tentativa in 1..limite_de_tentativas
  puts "\n\n"

  puts "Tentativa #{tentativa} de #{limite_de_tentativas}"
  puts 'Entre com o número'
  chute = gets
  puts "Será que acertou? Você chutou #{chute}"

  acertou = chute.to_i == numero_secreto

  if acertou
    puts 'Acertou!'
    break
  else
    maior = numero_secreto > chute.to_i
    if maior
      puts 'Número escolhido é maior'
    else
      puts 'Número escolhido é menor'
    end
  end
end
