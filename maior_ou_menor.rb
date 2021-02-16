# frozen_string_literal: true

def da_boas_vindas
  puts
  puts '        P  /_\\  P                              '
  puts '       /_\\_|_|_/_\\                             '
  puts '   n_n | ||. .|| | n_n         Bem vindo ao    '
  puts '   |_|_|nnnn nnnn|_|_|     Jogo de Adivinhação!'
  puts "  |' '  |  |_|  |'  ' |                        "
  puts "  |_____| ' _ ' |_____|                        "
  puts '        \\__|_|__/                              '
  puts
  puts 'Qual é o seu nome?'
  nome = gets.strip
  puts "\n\n\n"
  puts "Começaremos o jogo para você, #{nome}"
  nome
end

def escolhe_numero_secreto(dificuldade)
  maximo = case dificuldade
           when 1
             30
           when 2
             60
           when 3
             100
           when 4
             150
           else
             200
           end
  puts "Escolhendo um número secreto entre 1 e #{maximo}..."
  sorteado = rand(maximo) + 1
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
    ganhou
    return true
  end
  maior = numero_secreto > chute
  puts maior ? 'Número escolhido é maior' : 'Número escolhido é menor'
  false
end

def pede_dificuldade
  puts 'Qual o nível de dificuldade?'
  puts '(1) Muito fácil (2) Fácil (3) Normal (4) Difícil (5) Impossível'
  puts 'Escolha: '
  dificuldade = gets.to_i
end

def joga(nome)
  dificuldade = pede_dificuldade
  numero_secreto = escolhe_numero_secreto dificuldade
  pontos_ate_agora = 1000
  chutes = []

  limite_de_tentativas = 5

  (1..limite_de_tentativas).each do |tentativa|
    chute = pede_um_numero tentativa, limite_de_tentativas, chutes

    chutes << chute

    if nome == 'Rodrigo'
      ganhou
      break
    end

    pontos_a_perder = (chute - numero_secreto).abs / 2.0
    pontos_ate_agora -= pontos_a_perder

    break if verifica_se_acertou numero_secreto, chute

    puts "O número secreto era #{numero_secreto}." if tentativa == limite_de_tentativas
  end

  puts "Você ganhou #{pontos_ate_agora} pontos."
end

def nao_quer_jogar?
  puts 'Deseja jogar novamente? (S/N)'
  quero_jogar = gets.strip
  nao_quero_jogar = quero_jogar.upcase == 'N'
end

def ganhou
  puts
  puts '             OOOOOOOOOOO               '
  puts '         OOOOOOOOOOOOOOOOOOO           '
  puts '      OOOOOO  OOOOOOOOO  OOOOOO        '
  puts '    OOOOOO      OOOOO      OOOOOO      '
  puts '  OOOOOOOO  #   OOOOO  #   OOOOOOOO    '
  puts ' OOOOOOOOOO    OOOOOOO    OOOOOOOOOO   '
  puts 'OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  '
  puts 'OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  '
  puts 'OOOO  OOOOOOOOOOOOOOOOOOOOOOOOO  OOOO  '
  puts ' OOOO  OOOOOOOOOOOOOOOOOOOOOOO  OOOO   '
  puts '  OOOO   OOOOOOOOOOOOOOOOOOOO  OOOO    '
  puts '    OOOOO   OOOOOOOOOOOOOOO   OOOO     '
  puts '      OOOOOO   OOOOOOOOO   OOOOOO      '
  puts '         OOOOOO         OOOOOO         '
  puts '             OOOOOOOOOOOO              '
  puts
  puts '               Acertou!                '
  puts
end

nome = da_boas_vindas

loop do
  joga nome
  break if nao_quer_jogar?
end
