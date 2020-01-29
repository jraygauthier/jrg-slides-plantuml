# Usage avancé

## Usage avancé - Diagramme réutilisables

 -  Inclusion par path relatif:

    `./my-shared.iuml`:

    ```{.plantuml code_block=true}
    class MyClass1
    '..
    ```

    `./my-diagram.puml`:

    ```{.plantuml code_block=true}
    !%include ./my-shared.iuml
    ```

 -  Configuration par défaut:
    `./my-config.iuml`:

    ```{.plantuml code_block=true}
    skinparam backgroundColor Silver
    '..
    ```

    ```bash
    $ plantuml -I"./my-config.iuml" # ..
    # ..
    ```


## Usage avancé - Libraries globales

 -  Include search path:

    ```bash
    $ java -Dplantuml.include.path="/path/to/my/includes/dir" -jar plantuml.jar # ..
    # ..
    ```

 -  Permet d'inclure certaines libraries réutilisable à travers les projets.

    En particulier pratique pour les styles mais sans y être limité.


## Usage avancé - Réutilisation

 -  PlantUML vient avec un préprocesseur simple.

 -  Permet un certain niveau de réutilisation de diagrammes / parties de
    diagrammes et configuration.

 -  On peut par example penser à un diagramme paramétrable.

    `./my-parametrizable.iuml`:

    ```{.plantuml code_block=true}
    'TODO: Example
    ```

    `./my-concrete-diagram.puml`:

    ```{.plantuml code_block=true}
    'TODO: Example
    ```


## Usage avancé - Éviter la répétition

 -  Il arrive parfois que l'on se trouve à répéter un certain patron (timing
    diagram, etc).

 -  Le préprocesseur à la rescousse!

 -  Il est en effet possible de répéter un bout de diagramme plusieurs fois via
    une fonction récursive:

    ```{.plantuml code_block=true}
    'TODO: Example
    ```


## Usage avancé - Aspect visuel

```{.plantuml .column-split}
@startuml
skinparam backgroundColor LightYellow
skinparam state {
  StartColor MediumBlue
  EndColor Red
  BackgroundColor Peru
  BackgroundColor<<Warning>> Olive
  BorderColor Gray
  FontName Impact
}

[*] --> NotShooting

state "Not Shooting State" as NotShooting {
  state "Idle mode" as Idle <<Warning>>
  state "Configuring mode" as Configuring
  [*] --> Idle
  Idle --> Configuring : EvConfig
  Configuring --> Idle : EvConfig
}

NotShooting --> [*]
@enduml
```


## Usage avancé - Aspect visuel (suite)

```{.plantuml .column-split}
@startuml

skinparam backgroundColor #AAFFFF
skinparam activity {
  StartColor red
  BarColor SaddleBrown
  EndColor Silver
  BackgroundColor Peru
  BackgroundColor<< Begin >> Olive
  BorderColor Peru
  FontName Impact
}

(*) --> "Climbs on Platform" << Begin >>
--> === S1 ===
--> Bows
--> === S2 ===
--> WavesArmes
--> (*)

@enduml
```

 -  [Plus de détails: PlantUML - Skinparam](https://plantuml.com/skinparam)


## Usage avancé - Library standard

 Il existe des dépôts pour *Amazon AWS*, *Kubernetes*, la suite *Office*, etc.
 Petit example (AWS):

```{.plantuml .column-split}
@startuml
!include <aws/common>
!include <aws/Storage/AmazonS3/AmazonS3>
!include <aws/Storage/AmazonS3/bucket/bucket>

AMAZONS3(s3_internal)
AMAZONS3(s3_partner,"Vendor's S3")
s3_internal <- s3_partner
@enduml
```

 -  [Plus de détails: PlantUML Standard Library](https://plantuml.com/stdlib)

## Usage avancé - Génération de code à partir de diagramme et l'inverse

 -  Ce n'est pas quelque chose que j'ai eu l'opportunité de faire mais il semble
    exister plusieurs outils basé sur PlantUML pour faire ceci dans certain
    contextes:

     -  [jupe/puml2code: PlantUML code generator](https://github.com/jupe/puml2code)
     -  [grafov/plantuml2mysql - UML to SQL](https://github.com/grafov/plantuml2mysql)
     -  [Phil Factory - UML to SQL](https://www.red-gate.com/simple-talk/sql/sql-tools/automatically-creating-uml-database-diagrams-for-sql-server/)
     -  [chippyash/db-plantuml](https://github.com/chippyash/db-plantuml)

 -  Maintenant, est-ce que ceux-ci fonctionnent bien, à vous de voir!

 -  Également, pour une expérience plus interactive (non lié à PlantUML):

    [Sourcetrail](https://www.sourcetrail.com/)

    Référence de Jérôme.

    Un outil permettant d'explorer visuellement une base de code supportant C,
    C++, Java, Python.
