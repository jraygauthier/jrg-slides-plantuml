# Pourquoi PlantUML

TODO: Remplacer par les sources à jour.

## Pourquoi PlantUML - Simplicité

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

 -  On édite simplement le diagramme avec notre éditeur préféré.


[DSL]: https://en.wikipedia.org/wiki/Domain-specific_language


## Pourquoi PlantUML - Documentation vivante

Plus de diagrammes "pas à jour":

 -  Vit au même endroit que votre code source

 -  Versionnée

 -  Un refactor du code impliquera un refactor des diagrammes

 -  Un reviewer du code source verra également les changements au diagrammes


## Pourquoi PlantUML - Automatisable

Plus besoin d'opération manuelle désagréables:

 -  Une application en ligne de commande

 -  Peut donc être utilisé comme compilateur de votre documentation

 -  Un petit `Makefile` peut donc faire l'affaire.
