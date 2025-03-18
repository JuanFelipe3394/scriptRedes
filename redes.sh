#!/bin/bash

# Função para limpar a tela
echo "=== Diagnóstico de Rede ==="
clear_screen() {
    clear
}

# Função para testar conectividade com um host
# Utiliza o comando ping para enviar 4 pacotes ICMP
testar_ping() {
    read -p "Digite o endereço para testar o ping: " host
    ping -c 4 "$host"
}

# Função para exibir o gateway padrão da rede
testar_gateway() {
    echo "Gateway padrão:"
    ip route | grep default
}

# Função para exibir o endereço IP e máscara de rede
testar_ip() {
    echo "Endereço IP e máscara de rede:"
    ip addr show | grep "inet "
}

# Função para testar a resolução de nomes DNS
testar_dns() {
    read -p "Digite um domínio para testar a resolução DNS: " dominio
    nslookup "$dominio"
}

# Função para listar as portas abertas e serviços escutando no sistema
testar_portas() {
    echo "Portas abertas no sistema:"
    ss -tulnp
}

# Função para capturar e exibir pacotes de rede
tcpdump para capturar 10 pacotes na interface ativa
monitorar_trafego() {
    echo "Monitorando tráfego de rede (Ctrl+C para sair)..."
    sudo tcpdump -i any -c 10
}

# Loop principal do menu interativo
while true; do
    clear_screen
    echo "=== Menu de Diagnóstico de Rede ==="
    echo "1) Testar Ping"
    echo "2) Verificar Gateway Padrão"
    echo "3) Obter IP e Máscara de Rede"
    echo "4) Testar Resolução de DNS"
    echo "5) Ver Portas Abertas"
    echo "6) Monitorar Tráfego de Rede"
    echo "7) Sair"
    read -p "Escolha uma opção: " opcao
    
    case $opcao in
        1) testar_ping ;;  # Chama a função de teste de ping
        2) testar_gateway ;;  # Chama a função de verificação de gateway
        3) testar_ip ;;  # Chama a função de exibição de IP
        4) testar_dns ;;  # Chama a função de teste de DNS
        5) testar_portas ;;  # Chama a função de verificação de portas
        6) monitorar_trafego ;;  # Chama a função de monitoramento de tráfego
        7) exit ;;  # Sai do script
        *) echo "Opção inválida!" ;;  # Caso o usuário insira uma opção inválida
    esac
    
    read -p "Pressione Enter para continuar..."
done
