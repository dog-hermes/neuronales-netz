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

`artifact.html` wird automatisch vor jedem Commit neu erzeugt (Git-Hook in `.githooks/pre-commit`). Nach einem frischen Klonen den Hook einmal einschalten:

```bash
git config core.hooksPath .githooks
```

Von Hand geht es auch:

```bash
python3 build-artifact.py
```

## Veröffentlichung auf claude.ai

Die App ist als Artifact auf claude.ai veröffentlicht:

**https://claude.ai/artifact/7vqQTuUiqZgok5WV7VTNh1**

- `artifact.html` gelangt **nicht** über GitHub dorthin. Ein `git push` ändert das Artifact nicht.
- Hochgeladen wird über Claude Code (Artifact-Werkzeug). Beim Aktualisieren bleibt die Adresse gleich, nur der Inhalt wird ersetzt.
- Das Artifact ist zunächst **privat**. Andere können es erst öffnen, wenn es auf claude.ai über die Teilen-Funktion freigegeben wird.
- Nur in dieser veröffentlichten Version funktioniert der 💬 Netz-Assistent. Die Fragen gehen direkt an Claude, über das claude.ai-Konto der Person, die die Seite benutzt (und zählen zu deren Nutzungslimit). Mitgeschickt wird jeweils ein Schnappschuss vom aktuellen Zustand des Netzes.

Ablauf nach einer Änderung:

- **Änderung durch Claude Code:** Ein Claude-Code-Hook (`.claude/hooks/rebuild-artifact.sh`) erzeugt `artifact.html` sofort neu, und Claude veröffentlicht das Artifact danach automatisch.
- **Änderung von Hand:** Beim Committen wird `artifact.html` automatisch neu erzeugt. Zum Veröffentlichen in Claude Code sagen: „Aktualisiere das Artifact“.
