# Pourquoi PlantUML

## Pourquoi PlantUML - Simplicité

:::: columns
::: column
![So simple](https://media.giphy.com/media/dQkcf8GANR0ps57oBH/giphy.gif){width=75%} \
:::
::: column

 -  Représentation textuelle

    Un simple DSL^[1][DSL]^ / notation bien spécifiée pour déclarer des diagrammes.

 -  Gratuit

 -  Édité avec les mêmes outils que le code source

 -  Plus besoin de se poser des questions ennuyantes telles que:

     -  Quel est l'outil ayant servit à générer cette image?
     -  As t-on une license de disponible?
     -  Roule-t-il sur mon système?
     -  Ou est passé le bouton *x* pour faire *y*?
     -  Pourquoi ça ne charge plus?

 -  On édite simplement le diagramme avec notre éditeur préféré

:::
::::

[DSL]: https://en.wikipedia.org/wiki/Domain-specific_language


## Pourquoi PlantUML - Documentation vivante

:::: columns
::: column
![Beating heart](https://media.giphy.com/media/TLIed7IwyosvDnXZLD/giphy.gif){width=75%} \
:::
::: column

 -  Plus de diagrammes "pas à jour"

 -  Vit au même endroit que votre code source

 -  Versionnée

 -  Un refactor du code impliquera un refactor des diagrammes

 -  Un reviewer du code source verra également les changements au diagrammes

 -  Bref, on a les choses bien *en main*!

:::
::::


## Pourquoi PlantUML - Automatisable

![Automation](https://media.giphy.com/media/yoJC2o71OtZLQGO6JO/giphy.gif){height=400px} \

 -  Plus besoin d'opérations manuelles désagréables puisqu'on a une application
    en ligne de commande

 -  L'outil devient le compilateur pour votre documentation

 -  À ce titre, on peut même l'enrober dans un `Makefile` ou tout autre *build
    system* au choix

 -  Nous en parlerons plus en détails dans quelques "slides"


# Installation

## Installation - Requis

:::: columns
::: column
![java](./img/java.svg){width=75%} \
:::
::: column

 -  [Java Runtime Environment]( https://www.java.com/en/download/)

 -  [Graphviz](https://www.graphviz.org/download/)

 -  [`plantuml.jar`]

 -  Puisqu'en java, fonctionne donc sur toutes les plateformes supportant Java
    et Graphviz.

 -  Pour les plateformes unix-like: [nix]/[nixpkgs] offre un packet qui s'occupe de
    tout installer pour vous tout en exposant un petit executable `plantuml`:

    ```bash
    $ nix-env -i plantuml
    $ plantuml -help
    # ..
    ```

 -  Voir [installer nix] pour l'installation de [nix].

:::
::::

## Installation - Requis (suite)

 -  Il est possible que votre distribution linux ou package manager osx offre
    également un packet du même genre.

    Je vous laisse cependant l'exercice de le découvrir vous même.

 -  Pour tout autres plateformes, il s'agit d'installation les dépendances,
    [télécharger `plantuml.jar`] et de le rouler via la *JVM*.

    ```bash
    $ export GRAPHVIZ_DOT=/path/to/graphviz/dot
    $ java -jar /path/to/my/downloaded/plantuml.jar -help
    # ..
    ```

    À noter `GRAPHVIZ_DOT` permettant de spécifier l'emplacement d'installation
    de l'exécutable `dot`:

 -  Il pourrait être également utile (dépendamment des outils utilisés) d'exposer
    l'emplacement d'installation de `plantuml.jar` via `PLANTUML_JAR_PATH`.

[nix]: https://nixos.org/nix/download.html
[installer nix]: https://nixos.org/nix/download.html
[nixpkgs]: https://nixos.org/nixos/packages.html?channel=nixos-19.09
[`plantuml.jar`]: https://plantuml.com/download
[télécharger `plantuml.jar`]: https://plantuml.com/download

