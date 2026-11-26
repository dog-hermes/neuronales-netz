# Erzeugt artifact.html (Version für claude.ai) aus index.html.
# claude.ai legt selbst das HTML-Grundgerüst an, darum werden doctype/html/head/body entfernt.
import re, pathlib
here = pathlib.Path(__file__).parent
s = (here / 'index.html').read_text(encoding='utf-8')
for pat in [r'<!doctype html>\s*', r'<html[^>]*>\s*', r'<head>\s*', r'<meta charset[^>]*>\s*', r'<meta name="viewport"[^>]*>\s*', r'</head>\s*', r'<body>\s*', r'</body>\s*', r'</html>\s*']:
    s = re.sub(pat, '', s, count=1, flags=re.I)
(here / 'artifact.html').write_text(s, encoding='utf-8')
print('artifact.html geschrieben')
