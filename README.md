Readme
======

A plantuml reveal-js slide show.

Currently only available *en français*.

This might come to act as a scaffolding project for subsequent presentation.


Entering the reproducible environment
-------------------------------------

```bash
$ cd /path/to/this/repo
$ nix-shell
# ..
```

The previous steps require [nix].


Building and previewing
-----------------------

## Reveal-js output

```bash
$ cd /path/to/this/repo
$ make revealjs
# ..
$ firefox ./slides-revealjs.fr.html
```

A convenience target is also provided to do the same:

```bash
$ make revealjs-and-preview
# ..
```


Vscode
------

Also, if using *vscode*, make sure to launch it from within the nix environment:

```bash
$ code .
# ..
```

This will allow for the task we setup in `.vscode/tasks.json` to proceed correctly.

 -  `Ctrl + Shift + b`: runs `make revealjs`.


License
-------

The markdown document (`*.md`) for the slide show are licensed under
[*Creative Commons Attribution 4.0 International* license](./LICENSE.CC-BY-4).

All accompanying code is licensed under [*Apache 2.0* license](./LICENSE)

Credits to the original authors of the following [Giphy] animated `*.gif`:

 -  `./img/beating-heart.gif`:

    <https://giphy.com/gifs/hand-slow-squeeze-TLIed7IwyosvDnXZLD>

 -  `./img/so-simple.gif`:

    <https://giphy.com/gifs/bigbrotherafterdark-dQkcf8GANR0ps57oBH> 

 -  `./img/automation.gif`:

    <https://giphy.com/gifs/tinder-automation-automator-yoJC2o71OtZLQGO6JO>


Credits to the original author of the multiple plantuml example taken either as
is or adapted from <https://plantuml.com/>.


[nix]: https://nixos.org/nix/download.html
[Giphy]:https://giphy.com/

