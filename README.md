# mod-item-upgrade

**WORK IN PROGRESS**

An AzerothCore module (WotLK 3.3.5a) that lets players raise the stats of their gear rank by rank, for gold and tokens, in a window.

## Key features

- Up to 20 ranks on 41 stats, bought one by one or several at once.
- Weapons get two tracks of their own: damage and swing speed.
- Five power tokens, on top of the gold price.
- Looted, bought, crafted or won items can arrive already upgraded.
- Prices, gains, allowed items and stats all in database tables.
- Texts in English, French, German, Spanish and Russian.

## Dependencies

| Dependency | For |
|---|---|
| [AzerothCore](https://github.com/azerothcore/azerothcore-wotlk) (WotLK 3.3.5a) | the server |
| [mod-ale](https://github.com/azerothcore/mod-ale) | the window, the only way to upgrade |
| [AIO](https://github.com/Rochet2/AIO) | the window (version 1.75 or later): `AIO_Server` in `lua_scripts`, and the `AIO_Client` addon on every client |
| [mod-forever-ui](https://github.com/Adrestie/mod-forever-ui) | optional: the window becomes a tab of its Progression window |

## How to install

1. Download `installer.exe` from the [WoW-mods-installer releases](https://github.com/Adrestie/WoW-mods-installer/releases).
2. Stop the worldserver and close the game.
3. Run `installer.exe`, give it this folder and the folders it asks for, click **Check**, then **Install**.
4. Rebuild the worldserver. On its next start, the core applies the module's SQL.
5. The installer writes the tokens into `Data\patch-Z.MPQ`: give that archive to the other players.

## How to update

Same steps with the new version's folder, choosing **Update** instead of **Install**. Every upgrade bought, the tuning tables, and your `mod_item_upgrade.conf` settings are kept. Rebuild the worldserver.

## How to uninstall

Same steps, choosing **Remove**. Everything goes, database included: every upgrade bought is lost. Rebuild the worldserver.

## Credits

- [silviu20092/mod-item-upgrade](https://github.com/silviu20092/mod-item-upgrade), the original module this one forks: the whole upgrade system comes from it.

## Configuration

`mod_item_upgrade.conf` sets:

- the module on or off, and the stats that can be upgraded;
- random upgrades: their chance, how many stats and ranks, and when they happen (buying, looting, winning a roll, quest rewards, crafting);
- the weapon damage and swing speed tracks: their gains, tokens and gold price;
- how upgraded items are sent to the clients.

## Commands

| Command | |
|---|---|
| `/iu` | opens the window (also `/amelioration`, `/ameliorer`) |
| `.item_upgrade list [name]` | the upgrades on a player's equipped items |
| `.item_upgrade lock` | administrator: locks upgrades while tables are edited |
| `.item_upgrade reload` | administrator: reloads the tables and releases the lock |
