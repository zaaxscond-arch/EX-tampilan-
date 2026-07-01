#!/bin/bash

# =============================================
# ZAAX TOOL - by @zaaxdisini__
# Versi: 1.0
# =============================================

# Warna ANSI
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
NC='\033[0m' # No Color
BOLD='\033[1m'

# Fungsi Rainbow Text
rainbow() {
    local text="$1"
    local colors=($RED $YELLOW $GREEN $CYAN $BLUE $PURPLE)
    local len=${#text}
    for (( i=0; i<len; i++ )); do
        echo -ne "${colors[$((i % ${#colors[@]}))]}${text:$i:1}${NC}"
    done
    echo
}

# Fungsi Loading Animasi
loading() {
    local msg="$1"
    local chars=("█" "▓" "▒" "░")
    echo -ne "${CYAN}${msg} "
    for i in {1..20}; do
        echo -ne "${chars[$((i % 4))]}"
        sleep 0.05
    done
    echo -e " ${GREEN}✓${NC}"
    sleep 0.5
}

# Clear layar
clear

# Banner ASCII
echo -e "${CYAN}"
cat << "EOF"
   ███████╗ █████╗  █████╗ ██╗  ██╗
   ╚══███╔╝██╔══██╗██╔══██╗╚██╗██╔╝
     ███╔╝ ███████║███████║ ╚███╔╝ 
    ███╔╝  ██╔══██║██╔══██║ ██╔██╗ 
   ███████╗██║  ██║██║  ██║██╔╝ ██╗
   ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝
EOF
echo -e "${NC}"

rainbow "      ==== ZAAX TOOL v1.0 ===="
echo -e "${WHITE}      by ${BOLD}@zaaxdisini__${NC}"
echo ""

# Loading animasi
loading "Memuat sistem"
loading "Menginisialisasi modul"
loading "Menyambungkan database"
loading "Siap digunakan"

echo ""
echo -e "${GREEN}${BOLD}✓ Sistem berhasil dimuat!${NC}"
echo ""

# Menu utama
echo -e "${YELLOW}┌──────────────────────────────┐${NC}"
echo -e "${YELLOW}│       MENU UTAMA            │${NC}"
echo -e "${YELLOW}├──────────────────────────────┤${NC}"
echo -e "${CYAN}│ 1. Info Sistem              │${NC}"
echo -e "${CYAN}│ 2. Scan Network             │${NC}"
echo -e "${CYAN}│ 3. Tools                   │${NC}"
echo -e "${CYAN}│ 4. Keluar                  │${NC}"
echo -e "${YELLOW}└──────────────────────────────┘${NC}"
echo ""

# Input pilihan
echo -ne "${WHITE}Pilih menu [1-4]: ${NC}"
read pilihan

case $pilihan in
    1)
        echo ""
        echo -e "${BLUE}┌──────────────────────────────┐${NC}"
        echo -e "${BLUE}│        INFO SISTEM           │${NC}"
        echo -e "${BLUE}├──────────────────────────────┤${NC}"
        echo -e "${WHITE}│ User    : ${GREEN}$(whoami)${NC}"
        echo -e "${WHITE}│ Host    : ${GREEN}$(hostname)${NC}"
        echo -e "${WHITE}│ OS      : ${GREEN}$(uname -o)${NC}"
        echo -e "${WHITE}│ Kernel  : ${GREEN}$(uname -r)${NC}"
        echo -e "${WHITE}│ Uptime  : ${GREEN}$(uptime -p | cut -d' ' -f2-)${NC}"
        echo -e "${BLUE}└──────────────────────────────┘${NC}"
        ;;
    2)
        echo ""
        echo -e "${PURPLE}Scan network sedang dalam pengembangan...${NC}"
        ;;
    3)
        echo ""
        echo -e "${CYAN}Tools list:${NC}"
        echo -e " ${GREEN}•${NC} Ping Tool"
        echo -e " ${GREEN}•${NC} DNS Lookup"
        echo -e " ${GREEN}•${NC} Port Scanner"
        ;;
    4)
        echo ""
        rainbow "Terima kasih sudah menggunakan ZAAX TOOL!"
        echo -e "${RED}Bye bye~${NC}"
        exit 0
        ;;
    *)
        echo -e "${RED}Pilihan tidak valid!${NC}"
        ;;
esac

echo ""
echo -e "${YELLOW}Tekan Enter untuk kembali...${NC}"
read
exec "$0"
