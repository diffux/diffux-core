diffux-core
===========

Core services used by diffux/diffux

## Command-line tools

`diffux-core` comes with a couple of useful command-line tools.

### `diffux-snapshot`

Take a snapshot of a URL and save as a PNG image.

#### Example

Take a snapshot of http://www.google.com in a 1200 pixel wide window and save
as "google.png":

```bash
diffux-snapshot --url http://www.google.com \
                --outfile google.png -- \
                --width 1200
```

Take a snapshot of http://www.google.com in a 320 pixel wide window, use a
custom user-agent header, and save as "google-mobile.png":

```bash
diffux-snapshot --url http://www.google.com \
                --outfile google-mobile.png -- \
                --width 320 \
                --useragent "c3p0 (Netscape compatible)"
```
