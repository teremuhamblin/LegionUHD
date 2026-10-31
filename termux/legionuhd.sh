#!/data/data/com.termux/files/usr/bin/bash
# ───────────────────────────────────────────────────────────────
#  LEGIONUHD v4.0 — Tactical HUD Bootstrap
#  Optimisé, sécurisé, furtif, compatible Termux
# ───────────────────────────────────────────────────────────────

clear

# ───────────────────────────────────────────────────────────────
#  HUD — Bannière
# ───────────────────────────────────────────────────────────────
echo -e "\e[32m[LEGIONUHD] Initialisation du HUD tactique...\e[0m"
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
check_bin top
check_bin ip
check_bin termux-battery-status

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
#  Démarrage sécurisé des services
# ───────────────────────────────────────────────────────────────
start_service() {
    SERVICE="$1"
    CMD="$2"

    echo "[BOOT] Démarrage de $SERVICE..."

    # Vérifie si déjà actif
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
#  HUD — Monitoring rapide
# ───────────────────────────────────────────────────────────────
echo "[HUD] Lecture des paramètres système..."

BAT=$(termux-battery-status | jq -r '.percentage')
CPU=$(top -bn1 | awk '/%cpu/ {print $3}' | head -n1)
RAM=$(free -m | awk '/Mem/ {print $3}')
NET=$(ip -o addr | awk '/inet / {print $4}' | head -n1)

echo -e " • Batterie : $BAT%"
echo -e " • CPU      : $CPU"
echo -e " • RAM      : ${RAM}MB"
echo -e " • Réseau   : ${NET:-N/A}"

echo "──────────────────────────────────────────────"

# ───────────────────────────────────────────────────────────────
#  Nettoyage mémoire léger
# ───────────────────────────────────────────────────────────────
sync; echo 3 > /proc/sys/vm/drop_caches 2>/dev/null
echo "[CLEAN] Mémoire optimisée."

# ───────────────────────────────────────────────────────────────
#  Fin du bootstrap
# ───────────────────────────────────────────────────────────────
echo -e "\e[32m[LEGIONUHD]\e[0m Systèmes opérationnels."
echo "──────────────────────────────────────────────"
