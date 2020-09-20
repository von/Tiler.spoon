# [docs](index.md) » Tiler
---

Allows choosing a second window to tile next to the focused window.
Taken from @megalthic who apparently got if from @evantravers, who got it
from @tmiller. Converted to a spoon by @von.

## API Overview
* Functions - API calls offered directly by the extension
 * [bindHotKeys](#bindHotKeys)
 * [chooser](#chooser)
 * [debug](#debug)
 * [init](#init)
 * [start](#start)
 * [stop](#stop)

## API Documentation

### Functions

| [bindHotKeys](#bindHotKeys)         |                                                                                     |
| --------------------------------------------|-------------------------------------------------------------------------------------|
| **Signature**                               | `Tiler:bindHotKeys(table)`                                                                    |
| **Type**                                    | Function                                                                     |
| **Description**                             | The method accepts a single parameter, which is a table. The keys of the table                                                                     |
| **Parameters**                              | <ul><li>table - Table of action to key mappings</li></ul> |
| **Returns**                                 | <ul><li>Tiler object</li></ul>          |

| [chooser](#chooser)         |                                                                                     |
| --------------------------------------------|-------------------------------------------------------------------------------------|
| **Signature**                               | `Tiler:chooser`                                                                    |
| **Type**                                    | Function                                                                     |
| **Description**                             | Bring up a hs.chooser with a list of windows. Tile the chosen window to the right                                                                     |
| **Parameters**                              | <ul><li>* None</li></ul> |
| **Returns**                                 | <ul><li>* Nothing</li></ul>          |

| [debug](#debug)         |                                                                                     |
| --------------------------------------------|-------------------------------------------------------------------------------------|
| **Signature**                               | `Tiler:debug(enable)`                                                                    |
| **Type**                                    | Function                                                                     |
| **Description**                             | Enable or disable debugging                                                                     |
| **Parameters**                              | <ul><li>enable - Boolean indicating whether debugging should be on</li></ul> |
| **Returns**                                 | <ul><li>Nothing</li></ul>          |

| [init](#init)         |                                                                                     |
| --------------------------------------------|-------------------------------------------------------------------------------------|
| **Signature**                               | `Tiler:init()`                                                                    |
| **Type**                                    | Function                                                                     |
| **Description**                             | Initializes a Tiler                                                                     |
| **Parameters**                              | <ul><li>None</li></ul> |
| **Returns**                                 | <ul><li>Tiler object</li></ul>          |

| [start](#start)         |                                                                                     |
| --------------------------------------------|-------------------------------------------------------------------------------------|
| **Signature**                               | `Tiler:start()`                                                                    |
| **Type**                                    | Function                                                                     |
| **Description**                             | Start background activity.                                                                     |
| **Parameters**                              | <ul><li>param - Some parameter</li></ul> |
| **Returns**                                 | <ul><li>Tiler object</li></ul>          |

| [stop](#stop)         |                                                                                     |
| --------------------------------------------|-------------------------------------------------------------------------------------|
| **Signature**                               | `Tiler:stop()`                                                                    |
| **Type**                                    | Function                                                                     |
| **Description**                             | Stop background activity.                                                                     |
| **Parameters**                              | <ul><li>param - Some parameter</li></ul> |
| **Returns**                                 | <ul><li>Tiler object</li></ul>          |

