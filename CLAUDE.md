# Hampton Estate Wines — POS System

## What this is
Single-file HTML POS system for Hampton Estate Wines. All app logic, styles, and data live in `index.html`. No build step required.

## How to run locally
Open `index.html` in any browser, or serve with:
```bash
python3 -m http.server 8080
# then open http://localhost:8080
```

## Project structure
```
HAMPTON POS/
├── index.html              # The entire app (styles + JS + HTML)
├── CLAUDE.md               # This file
├── firebase.json           # Firebase Hosting config
├── .firebaserc             # Firebase project aliases (test + prod)
└── .github/workflows/
    └── deploy.yml          # CI/CD: develop→test, main→production
```

## Environments
| Branch    | Firebase Project              | URL                                        |
|-----------|-------------------------------|--------------------------------------------|
| `main`    | `hampton-estate-pos`          | https://hampton-estate-pos.web.app         |
| `develop` | `hampton-estate-pos-test`     | https://hampton-estate-pos-test.web.app    |

The app detects the environment at runtime from `window.location.hostname`:
- `hampton-estate-pos-test.web.app` or `localhost` → uses TEST Firebase project
- anything else → uses PRODUCTION Firebase project

## Epson TM-T82II-I Printer
- Connects via **Ethernet/LAN** — must be on same WiFi network as iPad
- The app sends print jobs directly via **Epson ePOS-Print** (no print dialog)
- Printer IP is configured in **Settings → Printer IP** within the app and stored in localStorage
- API endpoint: `http://[PRINTER_IP]/cgi-bin/epos/service.cgi`
- Falls back to `window.print()` (AirPrint dialog) if no IP configured or CORS blocked
- Paper: **80mm thermal**, ~48 chars per line at normal font

## Key areas in index.html
| Line range   | Content                                      |
|--------------|----------------------------------------------|
| 1–200        | CSS styles                                   |
| 200–630      | HTML structure (header, tabs, panels, modals)|
| 630–710      | Firebase setup + environment detection       |
| 710–2180     | All app JavaScript (menu, orders, guests)    |
| 2180–2310    | Print / docket functions                     |
| 2310–3100    | Reports, cottages, settings                  |
| 3100–3511    | ePOS SDK + printer settings UI               |

## Firebase Firestore collections
- `orders` — all POS orders (keyed by order ID)
- `meta/guests` — cottage guest list

## How to make changes
Edit `index.html` directly. For styling, search for the CSS variable block at line ~9.
For menu items, search for `var MENU` around line ~800.
For printer settings UI, search for `function openPrinterSettings`.

## Deploying
```bash
# Deploy to production (or just push to main — GitHub Actions handles it)
firebase deploy --only hosting:production

# Deploy to test
firebase deploy --only hosting:test
```

## Firebase CLI setup (first time only)
```bash
curl -sL https://firebase.tools | bash
firebase login
firebase use production
```
