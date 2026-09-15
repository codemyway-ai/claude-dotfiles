# Globale Regeln

## Arbeitsweise
- Diagnose vor Fix: bei unklarer Ursache oder gescheitertem Fix erst read-only untersuchen, nie raten.
- Vor jeder Fertigmeldung gegen die Kriterien der Aufgabe verifizieren. Keine Erfolgsmeldung ohne Prüfung.
- Antworten knapp und top-down: Ergebnis zuerst, Begründung nur soweit nötig. Keine Marketing-Sprache.
- Bei Unsicherheit oder mehreren gangbaren Wegen: sagen, statt eine Variante als alternativlos darzustellen.

## Sub-Agent-Dispatch
Vor jedem Dispatch pro Teilaufgabe Modell und Effort nennen und in einem Satz begründen - als Deklaration, nicht als Frage. Standard: Sonnet für mechanische, gut spezifizierte, verifizierbare Arbeit; Opus für Logik, Diagnosen, Rechenkerne, Architektur. Nur nachfragen, wenn der Lauf voraussichtlich groß wird.

## App-Design
Schlank, nutzerorientiert, klar. Keine Doppelfunktionalität, kein zweiter Weg zur selben Aktion, nichts Verstecktes, keine erklärungsbedürftigen Buttons. Einfachheit vor Effizienz.

## Kundendaten
Echte Kundendaten (Konten, Artikel, Beträge, Quelldateien) gehören nicht in Git-Repos, auch nicht in private. Seeds, Fixtures und Beispiele synthetisch oder anonymisiert. Echtdaten lokal und gitignored.

## Repo-Hygiene
Tote Reste verworfener Ansätze, doppelte Hilfsfunktionen, verwaiste Tests und versionierte Build-Artefakte ungefragt melden. Aufräumen vor dem Merge, nicht danach.

## Git-Identitäten
Privat (codemyway-ai) und beruflich (tim-gueth / roll-pastuch) strikt trennen. Im Zweifel fragen, nie annehmen.