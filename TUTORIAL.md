# Nice Huds And Events – Tutorial (NL)

Deze tutorial legt stap voor stap uit hoe je de datapack gebruikt op een survival server/wereld.

## Versie-compatibiliteit (belangrijk)

- Deze versie van de datapack is ingesteld voor **Minecraft / NeoForge 1.21.1** (`pack_format: 48`).
- Zie je in-game "made for a newer version"? Doe dan:
  1. `/datapack list`
  2. `/reload`
  3. Test opnieuw met `/trigger get_date` en `/trigger set_date set 20250131`

## 1) Installatie

1. Download of clone de datapack.
2. Zet de map/zip in je wereldmap:
   - `world/datapacks/`
3. Herstart de server of run:
   - `/reload`

Na load worden alle benodigde scoreboards en schedules automatisch aangemaakt.

## 2) Eerste keer gebruiken

De datapack maakt per speler bossbars aan wanneer de `create` advancement triggert (locatie-trigger).
Als je net joined bent en niets ziet, loop even rond of herlaad de wereld.

## 3) Clock HUD (standaard aan voor iedereen)

De klok-bossbar staat standaard **aan** voor iedere speler.

### Zelf aan/uit zetten
Gebruik:

- `/trigger clock_hud`

Dit togglet jouw persoonlijke clock HUD:
- 1e keer: uit
- 2e keer: aan

> Dit beïnvloedt alleen jouw eigen HUD, niet die van anderen.

## 4) Tijdformaat (12u/24u)

Er zijn twee instellingenfuncties:

- 12-uurs formaat: `/function huds:settings/12h_time_format`
- 24-uurs formaat: `/function huds:settings/24h_time_format`

Omdat dit `/function` commands zijn, zijn ze normaal gesproken voor operators/admins.

## 5) Datum/tijd opvragen als speler

### Huidige datum/tijd tonen
- `/trigger get_date`

### Positie + datum/tijd delen
- `/trigger send_position`

## 6) Datum handmatig instellen (met jaar)

Gebruik:

- `/trigger set_date set YYYYMMDD`

Voorbeelden:
- `/trigger set_date set 20250101`
- `/trigger set_date set 20301224`

Validatie in de datapack:
- input moet exact 8 cijfers zijn (`YYYYMMDD`)
- jaar moet 1000..9999 zijn
- maand moet 1..12 zijn
- dag moet passen binnen de maand (februari max 28)

Bij ongeldige input krijg je een foutmelding in chat.

## 7) Wat spelers zien op de clock bossbar

De clock bossbar toont o.a.:
- tijd (12u of 24u, afhankelijk van instelling)
- weer-icoon
- datum inclusief jaar

## 8) Handige admin-checklist

Na `/reload` kun je dit checken:

- `/scoreboard objectives list`
- controleer dat deze objectives bestaan:
  - `get_date`
  - `send_position`
  - `set_date`
  - `clock_hud`
  - `huds.calendar`
  - `huds.clock_enabled`

## 9) Veelvoorkomende issues

### "Mijn HUD verschijnt niet"
- Run `/reload`
- Wacht 1-2 seconden (de datapack maakt bossbars nu automatisch per speler aan)
- Test `/trigger clock_hud` om te kijken of hij per ongeluk uit staat

### "Set date werkt niet"
- Gebruik exact 8 cijfers in het format `YYYYMMDD`
- Voorbeeld: `20251231`
- Check dat trigger enabled is (datapack doet dit automatisch in de loop)

### "Na crash lijkt datum teruggezet"
Scoreboards/storage worden normaal opgeslagen, maar een hard crash kan rollback geven tot de laatste world save.

---

Als je wilt, kan ik ook een korte **player-facing versie** maken (alleen de 5 belangrijkste commands) voor op je Discord of server-welcome kanaal.
