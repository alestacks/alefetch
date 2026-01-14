#!/usr/bin/env bash


# Colors
BLUE="\e[34m"
CYAN="\e[36m"
RESET="\e[0m"
BOLD="\e[1m"

# System info
OS=$(lsb_release -a | awk -F: '/Description/ {gsub(/^[ \t]+/, "", $2); print $2}')
KERNEL=$(uname -r)
HOST=$(hostname)
UPTIME=$(uptime -p | sed 's/up //')
PKGS=$(pacman -Qq | wc -l)
MEM=$(free -m | awk '/Mem:/ {print $3 "MB / " $2 "MB"}')
CPU=$(lscpu | awk -F: '/Model name/ {gsub(/^ +/, "", $2); print $2}')
SHELL=$(basename "$SHELL")
DATE=$(date)

printf "%b\n" "${BLUE}
.------..------..------.
|A.--. ||L.--. ||E.--. |
| (\/) || :/\: || (\/) |
| :\/: || (__) || :\/: |
| '--'A|| '--'L|| '--'E|
\`------'\`------'\`------'
${NC}"

printf "%b\n" \
"$(printf "${CYAN}${BOLD}%-10s${RESET} %s" "OS:" "$OS")" \
"$(printf "${CYAN}${BOLD}%-10s${RESET} %s" "Hostname:" "$HOST")" \
"$(printf "${CYAN}${BOLD}%-10s${RESET} %s" "Kernel:" "$KERNEL")" \
"$(printf "${CYAN}${BOLD}%-10s${RESET} %s" "Uptime:" "$UPTIME")" \
"$(printf "${CYAN}${BOLD}%-10s${RESET} %s" "Packages:" "$PKGS")" \
"$(printf "${CYAN}${BOLD}%-10s${RESET} %s" "Shell:" "$SHELL")" \
"$(printf "${CYAN}${BOLD}%-10s${RESET} %s" "Memory:" "$MEM")" \
"$(printf "${CYAN}${BOLD}%-10s${RESET} %s" "CPU:" "$CPU")" \
"$(printf "${CYAN}${BOLD}%-10s${RESET} %s" "Date:" "$DATE")" \
""

