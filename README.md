diffux-core
===========
[![Gem Version](https://badge.fury.io/rb/diffux-core.svg)](http://badge.fury.io/rb/diffux-core)
[![Build Status](https://travis-ci.org/diffux/diffux-core.svg)](https://travis-ci.org/diffux/diffux-core)
[![Code Climate](https://codeclimate.com/github/diffux/diffux-core.png)](https://codeclimate.com/github/diffux/diffux-core)
[![Coverage](https://codeclimate.com/github/diffux/diffux-core/coverage.png)](https://codeclimate.com/github/diffux/diffux-core)

Core services used by [diffux/diffux].

[Documentation]

[diffux/diffux]: https://github.com/diffux/diffux
[Documentation]: http://rubydoc.info/github/diffux/diffux-core

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

You can limit the area that the snapshot image is taken for by providing a
`cropselector` option:

```bash
diffux-snapshot --url http://www.yahoo.com \
                --outfile yahoo.png -- \
                --cropselector ".searchwrapper"
```

In this example, if no element is found with a `searchwrapper` class on the
page, the crop selector will be ignored and the snapshot will contain the
entire page.

If more than one element matches the crop selector, only the first one will be
included in the snapshot image.

### `diffux-compare`

Compare two snapshots (or any images for that matter) and outputs a diff if the
two images are different.

#### Example

Compare a previously snapshotted google.com image with a new version:

```bash
diffux-compare --before-image google1.png \
               --after-image google2.png
```

If a diff is detected, a `diff.png` file is saved in the current folder. This
file is a side-by-side line-up of the before and after image with a diff
representation in the middle. The script will also exit with a non-zero exit
code.

If there is no diff between the before and after image, the program will
silently exit with no output. The exit code in this case is zero.

You can override the output file if you want to:

```bash
diffux-compare --before-image google1.png \
               --after-image google2.png \
               --outfile diff.png
```

Here's an example of a diff.png output from `diffux-compare`:

![Example of a Diffux diff](https://diffux.github.io/diffux-core/images/diff-example.png "Example of a Diffux diff")
