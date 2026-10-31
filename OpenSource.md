###### — Open Source Passive Signal Intelligence Platform
```text
- une page de présentation complète, comme un README d’un projet GitHub professionnel  
- un style militaire / SIGINT, cohérent avec LegionUHD  
- une structure identique à ORION, mais réécrite pour ton univers  
- prête à être copiée dans ton dépôt GitHub  
```

# 🛰️ LegionUHD 🛰️ 

LegionUHD est une plateforme open‑source de renseignement passif (Passive Signal Intelligence) conçue pour Android + Termux.  
Elle fournit un HUD tactique, un radar SIGINT, et un ensemble de modules de surveillance passive permettant d’observer, analyser et cartographier l’environnement numérique local — sans émettre, sans intrusion, et sans impact réseau.

LegionUHD est pensé comme un système de reconnaissance personnel, léger, modulaire, et entièrement local, inspiré des interfaces militaires modernes (FÉLIN, Ghost Recon, Black‑Ops).

---

## 🛡️ Objectif du projet

LegionUHD vise à offrir :

- une interface HUD militaire ultra‑fluide  
- un radar passif capable de détecter les signaux environnants  
- une analyse locale sans cloud, sans dépendances externes  
- une cartographie dynamique des appareils, signaux et anomalies  
- une plateforme modulaire pour extensions SIGINT, OSINT local, monitoring réseau  
- une intégration possible avec Home Assistant, MQTT, API REST, WebSocket  

---

## ⚙️ Architecture générale

LegionUHD repose sur une architecture simple mais robuste :

### 1. Core Termux
- Scripts Bash + Python  
- Modules SIGINT passifs  
- Analyse locale (Wi‑Fi, BLE, LAN, vendor lookup, delta tracking)  
- Moteur HUD CLI + API locale  

### 2. HUD Android
- Interface militaire minimaliste  
- Modes tactiques : Recon, Ghost, Blackout, ULTRA  
- Widgets dynamiques (CPU, RAM, net‑anomalies, signal map)  
- Animations HUD (radar, pulse, sweep, threat markers)

### 3. Assets
- Icônes HUD  
- Thèmes tactiques  
- Animations radar  
- Licence personnelle open‑source (voir `assets/LICENSE.md`)

### 4. API Locale
- Serveur local 127.0.0.1  
- Dashboard web tactique (optionnel)  
- Intégration possible avec Home Assistant, MQTT, Node‑RED, automations externes  

---

## 🛰️ Fonctionnalités principales

### 🔍 Recon Mode — Passive Signal Sweep
- Scan passif Wi‑Fi  
- Scan passif BLE  
- Identification OUI / Vendor  
- Cartographie dynamique  
- Détection NEW / LOST / RETURNING  
- Timeline des événements

### 👻 Ghost Mode — Stealth Monitoring
- Silence terminal complet  
- Pas d’émission réseau  
- Pas de logs persistants  
- Surveillance discrète de l’environnement

### 🌑 Blackout Mode — Full HUD Silence
- Interface réduite  
- Aucun bruit visuel  
- Monitoring minimal  
- Mode infiltration / économie d’énergie

### ⚡ ULTRA Mode — Full Tactical Suite
- HUD complet  
- Radar animé  
- Analyse réseau locale  
- Détection d’anomalies CPU/RAM  
- Monitoring des services Android  
- Export de rapports

---

## 📡 SIGINT Modules (passifs)

- Wi‑Fi Passive Sweep  
- BLE Passive Sweep  
- LAN Passive Discovery  
- Vendor OSINT local  
- Delta Tracking  
- Threat Level Estimation  
- Signal Map 360°  

---

## 🔐 Sécurité & Confidentialité

LegionUHD est :

- 100% offline  
- sans cloud  
- sans télémétrie  
- sans dépendances propriétaires  
- sans émission réseau non demandée  

Tout reste local, sur l’appareil de l’utilisateur.

---

## 📜 Licences

### Code source (racine du projet)
**The Unlicense** — domaine public  
→ utilisation, modification, redistribution libres

### Dossier `assets/`
**Licence personnelle open‑source**  
→ attribution obligatoire  
→ voir `assets/LICENSE.md`

---

## 🧩 Attribution recommandée
Voici le document complet, en un seul fichier Markdown, prêt à être intégré dans ton dépôt GitHub pour LegionUHD — Open Source Passive Signal Intelligence Platform.

Aucun découpage, aucun commentaire externe : un seul fichier propre, structuré, professionnel, militaire, comme demandé.

---

`markdown

🛰️ LegionUHD — Open Source Passive Signal Intelligence Platform

LegionUHD est une plateforme open‑source de renseignement passif (Passive Signal Intelligence) conçue pour Android + Termux.  
Elle fournit un HUD tactique, un radar SIGINT, et un ensemble de modules de surveillance passive permettant d’observer, analyser et cartographier l’environnement numérique local — sans émettre, sans intrusion, et sans impact réseau.

LegionUHD est pensé comme un système de reconnaissance personnel, léger, modulaire, et entièrement local, inspiré des interfaces militaires modernes (FÉLIN, Ghost Recon, Black‑Ops).

---

🛡️ Objectif du projet

LegionUHD vise à offrir :

- une interface HUD militaire ultra‑fluide  
- un radar passif capable de détecter les signaux environnants  
- une analyse locale sans cloud, sans dépendances externes  
- une cartographie dynamique des appareils, signaux et anomalies  
- une plateforme modulaire pour extensions SIGINT, OSINT local, monitoring réseau  
- une intégration possible avec Home Assistant, MQTT, API REST, WebSocket  

---

⚙️ Architecture générale

LegionUHD repose sur une architecture simple mais robuste :

1. Core Termux
- Scripts Bash + Python  
- Modules SIGINT passifs  
- Analyse locale (Wi‑Fi, BLE, LAN, vendor lookup, delta tracking)  
- Moteur HUD CLI + API locale  

2. HUD Android
- Interface militaire minimaliste  
- Modes tactiques : Recon, Ghost, Blackout, ULTRA  
- Widgets dynamiques (CPU, RAM, net‑anomalies, signal map)  
- Animations HUD (radar, pulse, sweep, threat markers)

3. Assets
- Icônes HUD  
- Thèmes tactiques  
- Animations radar  
- Licence personnelle open‑source (voir assets/LICENSE.md)

4. API Locale
- Serveur local 127.0.0.1  
- Dashboard web tactique (optionnel)  
- Intégration possible avec Home Assistant, MQTT, Node‑RED, automations externes  

---

🛰️ Fonctionnalités principales

🔍 Recon Mode — Passive Signal Sweep
- Scan passif Wi‑Fi  
- Scan passif BLE  
- Identification OUI / Vendor  
- Cartographie dynamique  
- Détection NEW / LOST / RETURNING  
- Timeline des événements

👻 Ghost Mode — Stealth Monitoring
- Silence terminal complet  
- Pas d’émission réseau  
- Pas de logs persistants  
- Surveillance discrète de l’environnement

🌑 Blackout Mode — Full HUD Silence
- Interface réduite  
- Aucun bruit visuel  
- Monitoring minimal  
- Mode infiltration / économie d’énergie

⚡ ULTRA Mode — Full Tactical Suite
- HUD complet  
- Radar animé  
- Analyse réseau locale  
- Détection d’anomalies CPU/RAM  
- Monitoring des services Android  
- Export de rapports

---

📡 SIGINT Modules (passifs)

- Wi‑Fi Passive Sweep  
- BLE Passive Sweep  
- LAN Passive Discovery  
- Vendor OSINT local  
- Delta Tracking  
- Threat Level Estimation  
- Signal Map 360°  

---

🔐 Sécurité & Confidentialité

LegionUHD est :

- 100% offline  
- sans cloud  
- sans télémétrie  
- sans dépendances propriétaires  
- sans émission réseau non demandée  

Tout reste local, sur l’appareil de l’utilisateur.

---

📜 Licences

Code source (racine du projet)
The Unlicense — domaine public  
→ utilisation, modification, redistribution libres

Dossier assets/
Licence personnelle open‑source  
→ attribution obligatoire  
→ voir assets/LICENSE.md

---

🧩 Attribution recommandée

```text
LegionUHD — Open Source Passive Signal Intelligence Platform
Créé par Teremu / Major Hamblin
```

---

🚀 Roadmap

- HUD animé v6.0 OMEGA  
- Radar 3D  
- Module OSINT enrichi offline  
- Intégration Home Assistant complète  
- Mode “Sentinel” (surveillance continue)  
- Export JSON pour IA / analyse externe  
- Pack d’icônes tactiques v2.0  

---

🛰️ Conclusion

LegionUHD est une plateforme SIGINT passive, open‑source, locale, et entièrement modulaire.  
Elle combine :

- un HUD militaire  
- un radar passif  
- une analyse locale avancée  
- une architecture propre et extensible  

C’est l’équivalent open‑source d’un système de reconnaissance personnel, conçu pour Android + Termux.

---
