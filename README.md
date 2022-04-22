Readme
======

A plantuml reveal-js slide show.

Currently only [available *en français*].

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


GitHub pages
------------

This slide show is currently hosted on [GitHub Pages].

Here's the link: <https://jraygauthier.github.io/jrg-slides-plantuml/>.

The source for the index page is [docs/index.md](./docs/index.md).

GitHub is in charge of rendering `index.md` to a *html* page through
Jekyll.


### Publishing an updated version of the slides

```bash
$ make publish-site
# ..
```

This will make the slides and copy the result to their expected
location under the `./docs/` folder (which GitHub takes as input
for the hosted web site).


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

Credits to some of my colleagues for landing me some more concrete diagrams of
their own:

 -  *Francis Lachapelle*: Timing diagram example

Todo
----

A list of various improvements that would enhance this presentation
or this method of doing presentations. See:

[TODO.md](./TODO.md).



[available *en français*]: https://jraygauthier.github.io/jrg-slides-plantuml/.
[nix]: https://nixos.org/nix/download.html
[Giphy]:https://giphy.com/
[GitHub Pages]: https://pages.github.com/
