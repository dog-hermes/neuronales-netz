# 🧠 Neuronales Netz erleben

Eine interaktive Lern-App, die zeigt, wie ein kleines neuronales Netz denkt und lernt – Schritt für Schritt, ohne Vorwissen.

Das Netz beantwortet eine einfache Alltagsfrage: **„Gehe ich heute joggen?“**

## Was man damit machen kann

1. **Dein Tag** – Mit drei Reglern beschreibst du den Tag: ☀️ Wetter, 😴 Müdigkeit und ⏰ freie Zeit.
2. **Zuschauen** – Du verfolgst Schritt für Schritt (oder als Animation), wie die Werte durch das Netz fliessen und jedes Neuron rechnet.
3. **Was war richtig?** – Du sagst dem Netz die richtige Antwort. Dann siehst du, wie es rückwärts lernt (Backpropagation) und seine Gewichte anpasst. Trainieren geht in Zeitlupe, normal oder schnell.
4. **Netz umbauen** – Du fügst versteckte Schichten und Neuronen hinzu oder entfernst sie, würfelst die Gewichte neu oder änderst einzelne Werte von Hand.

Dazu gibt es:

- 🌀 **Quetschfunktion** – die Sigmoid-Funktion σ(z) = 1 / (1 + e^(−z)) zum Ausprobieren
- 📉 **Fehlerkurve** – zeigt, wie der Fehler beim Training sinkt
- 📒 **Beispieltage** – die Trainingsdaten, die du selbst ergänzen kannst
- **Formeln anzeigen** – blendet zu jedem Schritt die Mathematik ein
- ❓ **Tour** – eine geführte Einführung
- 💬 **Netz-Assistent** – ein Chat, der Fragen zum aktuellen Zustand des Netzes beantwortet (nur in der auf claude.ai veröffentlichten Version)
- Hell- und Dunkelmodus

## Starten

Es braucht keine Installation und keinen Server. Einfach `index.html` im Browser öffnen:

```bash
open index.html
```

## Dateien

| Datei | Zweck |
|---|---|
| `index.html` | Die komplette App (HTML, CSS und JavaScript in einer Datei) |
| `artifact.html` | Version für die Veröffentlichung als Artifact auf claude.ai (ohne HTML-Grundgerüst) |
| `build-artifact.py` | Erzeugt `artifact.html` aus `index.html` |

Nach Änderungen an `index.html` die Artifact-Version neu erzeugen:

```bash
python3 build-artifact.py
```
