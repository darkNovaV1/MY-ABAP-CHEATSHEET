
# Eclipse ADT Tips and Tricks

This document contains useful tips and tricks for using ABAP Development Tools (ADT) in Eclipse.

## General Shortcuts

| Shortcut            | Description                  |
|---------------------|------------------------------|
| `CTRL + SHIFT + L`  | List of all shortcuts        |
| `CTRL + 3`          | Quick Access                 |

## Code Navigation

| Shortcut                        | Description                                                               |
|---------------------------------|---------------------------------------------------------------------------|
| `F3` or `CTRL + Mouse Over`     | Navigate to a development object                                          |
| `ALT + SHIFT + B`               | Trigger breadcrumb (navigate to relevant occurrence)                      |
| `CTRL + H`                      | Search for development objects in all ABAP projects                       |
| `CTRL + SHIFT + G`              | Get Where Used List                                                      |
| `CTRL + SHIFT + A`              | Open a development object (use "Type:<type>" in search window, e.g., ddl, cl, view, etc.) |
| `ALT + F2`                      | Display the method signature at any position between METHOD and ENDMETHOD |
| `F2`                            | Element Info popup (press F2 on an identifier such as the name of a method, database table, or interface) |

## Code Editing

| Shortcut            | Description                                                 |
|---------------------|-------------------------------------------------------------|
| `CTRL + SHIFT + ,`  | Comment (Fun fact: SHIFT + , => '<')                        |
| `CTRL + SHIFT + .`  | Uncomment (Fun fact: SHIFT + . => '>')                      |
| `CTRL + 1`          | Quick Fix (suggestions)                                     |
| `CTRL + SPACE`      | Content assist (use TAB to apply proposal code)             |

## Code Execution and Activation

| Shortcut            | Description                                                 |
|---------------------|-------------------------------------------------------------|
| `ALT + F8`          | Run object in SAP GUI                                       |
| `CTRL + F2`         | Manual syntax check (if auto syntax check is disabled)      |
| `CTRL + F3`         | Activate a single development object                        |
| `CTRL + SHIFT + F3` | Activate multiple development objects                       |

## Documentation

Use `!` characters to define ABAP doc one line before the relevant statement.

Example:
```abap
"! Creates an {@link IF_HTTP_CLIENT} object for the given URL and data. <br>
"! You can use {@link IF_HTTP_CLIENT.METH:send} to execute your request.
"!
"! @parameter i_url | Host URL
"! @parameter i_cdata | Data to process
"! @parameter eo_httpc | HTTP client
"! @parameter e_code | Error code
"! @parameter e_msg | Error message
```

## Other Useful Shortcuts

| Shortcut            | Description                                                 |
|---------------------|-------------------------------------------------------------|
| `CTRL + ALT + C`    | Compare with                                                |
| `CTRL + T`          | Quick type hierarchy for ABAP class and interface           |

## Preferences and Settings

### Formatting Preference
Navigate to: 
`Window > Preferences > ABAP Development > Editors > Source Code Editors`

This page allows you to predefine the formatting of ABAP source code for each ABAP project.

### Syntax Coloring
Navigate to:
`Window > Preferences > ABAP Development > Editors > Source Code Editors > ABAP Source Code Colors`
