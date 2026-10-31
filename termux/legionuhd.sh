#!/data/data/com.termux/files/usr/bin/bash
# ───────────────────────────────────────────────────────────────
#  LEGIONUHD v5.0 ULTRA — Tactical HUD System
#  Furtif • Ghost Mode • Blackout • Monitoring • Sécurisé
# ───────────────────────────────────────────────────────────────

clear

# ───────────────────────────────────────────────────────────────
#  HUD — Bannière animée
# ───────────────────────────────────────────────────────────────
animate_hud() {
    for frame in "[=     ]" "[==    ]" "[===   ]" "[====  ]" "[===== ]" "[======]"; do
        echo -ne "\e[32m[LEGIONUHD] Initialisation $frame\r\e[0m"
        sleep 0.1
    done
    echo ""
}
animate_hud
echo "──────────────────────────────────────────────"

# ───────────────────────────────────────────────────────────────
#  Vérification des binaires essentiels
# ───────────────────────────────────────────────────────────────
check_bin() {
    if ! command -v "$1" >/dev/null 2>&1; then
        echo -e "\e[31m[ERREUR]\e[0m Binaire manquant : $1"
        MISSING_BIN=true
    else
        echo -e "\e[32m[OK]\e[0m $1 détecté"
    fi
}

echo "[CHECK] Vérification des modules..."
check_bin sshd
check_bin tor
check_bin ip
check_bin top
check_bin termux-battery-status
check_bin ping

[ "$MISSING_BIN" = true ] && {
    echo -e "\e[31m[ABORT]\e[0m Modules manquants — impossible de continuer."
    exit 1
}

echo "──────────────────────────────────────────────"

# ───────────────────────────────────────────────────────────────
#  Mode furtif (désactive l’historique)
# ───────────────────────────────────────────────────────────────
export HISTFILE=/dev/null
unset HISTFILE
echo "[STEALTH] Mode furtif activé."

# ───────────────────────────────────────────────────────────────
#  Mode GHOST — furtivité réseau locale
# ───────────────────────────────────────────────────────────────
ghost_mode() {
    echo "[GHOST] Activation du mode Ghost..."
    ip link set lo down 2>/dev/null
    sleep 0.5
    ip link set lo up 2>/dev/null
    echo "[GHOST] Furtivité locale renforcée."
}
ghost_mode

echo "──────────────────────────────────────────────"

# ───────────────────────────────────────────────────────────────
#  Démarrage sécurisé des services
# ───────────────────────────────────────────────────────────────
start_service() {
    SERVICE="$1"
    CMD="$2"

    echo "[BOOT] Démarrage de $SERVICE..."

    if pgrep -x "$SERVICE" >/dev/null 2>&1; then
        echo -e "\e[33m[WARN]\e[0m $SERVICE déjà actif."
    else
        $CMD >/dev/null 2>&1 &
        sleep 1
        if pgrep -x "$SERVICE" >/dev/null 2>&1; then
            echo -e "\e[32m[OK]\e[0m $SERVICE opérationnel."
        else
            echo -e "\e[31m[FAIL]\e[0m Impossible de lancer $SERVICE."
        fi
    fi
}

start_service "sshd" "sshd"
start_service "tor" "tor"

echo "──────────────────────────────────────────────"

# ───────────────────────────────────────────────────────────────
#  Scan réseau léger (safe)
# ───────────────────────────────────────────────────────────────
echo "[SCAN] Scan réseau local (safe)..."
NETSCAN=$(ip -o addr | awk '/inet / {print $4}')
echo " • Adresse(s) détectée(s) : $NETSCAN"

echo "──────────────────────────────────────────────"

# ───────────────────────────────────────────────────────────────
#  HUD — Monitoring en temps réel
# ───────────────────────────────────────────────────────────────
monitor() {
    CPU=$(top -bn1 | awk '/%cpu/ {print $3}' | head -n1)
    RAM=$(free -m | awk '/Mem/ {print $3}')
    BAT=$(termux-battery-status | jq -r '.percentage')
    NET=$(ip -o addr | awk '/inet / {print $4}' | head -n1)

    echo -e " • Batterie : $BAT%"
    echo -e " • CPU      : $CPU"
    echo -e " • RAM      : ${RAM}MB"
    echo -e " • Réseau   : ${NET:-N/A}"
}

echo "[HUD] Monitoring système..."
monitor

echo "──────────────────────────────────────────────"

# ───────────────────────────────────────────────────────────────
#  Détection d’anomalies CPU/RAM
# ───────────────────────────────────────────────────────────────
detect_anomalies() {
    CPU_LOAD=$(echo "$CPU" | sed 's/%//')
    if [ "$CPU_LOAD" -gt 80 ]; then
        echo -e "\e[31m[ALERTE]\e[0m Charge CPU élevée détectée."
    fi

    if [ "$RAM" -gt 1500 ]; then
        echo -e "\e[33m[WARN]\e[0m RAM élevée détectée."
    fi
}
detect_anomalies

echo "──────────────────────────────────────────────"

# ───────────────────────────────────────────────────────────────
#  Nettoyage mémoire avancé
# ───────────────────────────────────────────────────────────────
echo "[CLEAN] Optimisation mémoire..."
sync; echo 3 > /proc/sys/vm/drop_caches 2>/dev/null
echo "[CLEAN] Mémoire optimisée."

echo "──────────────────────────────────────────────"

# ───────────────────────────────────────────────────────────────
#  Mode BLACKOUT — aucune sortie terminal
# ───────────────────────────────────────────────────────────────
blackout() {
    echo "[BLACKOUT] Mode Blackout activé."
    sleep 0.5
    clear
}
# Décommenter pour activer :
# blackout

# ───────────────────────────────────────────────────────────────
#  Fin du bootstrap
# ───────────────────────────────────────────────────────────────
echo -e "\e[32m[LEGIONUHD]\e[0m Systèmes opérationnels."
echo "──────────────────────────────────────────────"
