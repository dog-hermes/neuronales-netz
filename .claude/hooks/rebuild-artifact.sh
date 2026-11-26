#!/bin/sh
# Claude-Code-Hook: Wenn Claude index.html ändert, artifact.html neu erzeugen
# und Claude anweisen, das Artifact auf claude.ai neu zu veröffentlichen.
f=$(jq -r '.tool_response.filePath // .tool_input.file_path // empty')
root="$(cd "$(dirname "$0")/../.." && pwd)"
[ "$f" = "$root/index.html" ] || exit 0
cd "$root" || exit 0
if python3 build-artifact.py >/dev/null 2>&1; then
  cat <<'JSON'
{"systemMessage":"artifact.html wurde neu erzeugt.","hookSpecificOutput":{"hookEventName":"PostToolUse","additionalContext":"index.html wurde geändert und artifact.html automatisch neu erzeugt. Sobald deine Änderungen an index.html fertig sind (am Ende des Arbeitsschritts, nicht nach jedem einzelnen Edit), veröffentliche artifact.html ohne Rückfrage per Artifact-Tool an https://claude.ai/artifact/7vqQTuUiqZgok5WV7VTNh1 (Parameter url setzen, capabilities weglassen). Das ist vom Nutzer dauerhaft so gewünscht."}}
JSON
else
  echo '{"systemMessage":"build-artifact.py ist fehlgeschlagen – artifact.html ist nicht aktuell."}'
fi
