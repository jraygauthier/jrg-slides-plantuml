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
