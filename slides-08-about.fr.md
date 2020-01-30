# À-propos

## À-propos - Outils similaires

 -  [WebSequenceDiagrams]

    Celui qui aura inspiré l'auteur.

    Permet de faire des diagrammes de séquence.

 -  [flowchart.js]

    Permet de faire des diagrammes d'activité / diagrammes blocs.

 -  [js-sequence-diagrams]

    Permet de faire des diagrammes de séquence.

 -  [mermaid]

    Permet de faire: activité, séquence, Gantt, class, state, etc.

    Celui qui se rapproche le plus de *PlanUML* au niveau de la largeur de
    couverture.

 -  [wavedrom]

    Permet de faire des *timing diagrams*.


[flowchart.js]: http://flowchart.js.org/
[js-sequence-diagrams]: https://bramp.github.io/js-sequence-diagrams/
[mermaid]: https://github.com/mermaid-js/mermaid
[wavedrom]: https://wavedrom.com/


## À-propos - Ressources

 -  <https://plantuml.com>

    Le site officiel. Vous y trouverez un documentation généralement assez
    complète sur chacun des types de diagrammes (beaucoup d'examples).

 -  [PlantUML Q&A](https://forum.plantuml.net/)

    Lorsque vous avez des questions plus pointues, une petite recherche / poser
    une question sur le forum officiel est un des meilleur moyen d'obtenir une
    réponse avant d'aller fouiller le code source.

    Je vous conseille de vous abonner au flux RSS de ce forum pour les
    nouveautés.

 -  [Real World PlantUML](https://real-world-plantuml.com/)

    Grosse librairie comportant des example des différents types de diagrammes.

 -  [All Skin Parameters](https://plantuml-documentation.readthedocs.io/en/latest/formatting/all-skin-params.html)

    Une excellente documentation de la grosse majorité des paramètres permettant
    de changer l'aspect visuel. À noter, tout n'est malheureusement pas là.

 -  [External and useful links](https://plantuml.com/external-links)

    Plusieurs références vers des outils utilisant ou liés à PlantUML.


## À-propos - Cette présentation

 -  À noter qu'une grande partie des examples proviennent ou ont été adapté à
    partir de ceux fournis sur <https://plantuml.com>.

    Merci donc à l'auteur original.

 -  *Powered by* [pandoc], [plantuml] and [nix].

    Cette présentation est écrite en [Pandoc's Markdown], les diagrammes
    plantuml sont tout générés *on the fly* via [plantuml] lors du build de
    cette documentation. Il ont donc été testés avec la version de plantuml
    fournie par l'environement [nix] `shell.nix` à la racine de ses sources.

 -  Plusieurs morceaux ont été empruntés à [pandoc-md-wiki], en particulier:

     -  Filtres [pandoc]
     -  *Syntax highlight* pour plantuml

 -  Pour les intéressés, le code source permettant de compiler cette
    présentation ainsi que le résultat de cette compilation ont été rendu
    publics aux emplacements respectif suivants:

     -  <https://github.com/amotus/jrg-slides-plantuml>
     -  <https://amotus.github.io/jrg-slides-plantuml/>


[Pandoc's Markdown]: https://pandoc.org/MANUAL.html#pandocs-markdown
[plantuml]: https://plantuml.com/
