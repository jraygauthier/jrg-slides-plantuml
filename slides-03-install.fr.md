
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
