# Types de diagrammes Non-UML

## Types de diagrammes - Entity Relationship

Une extension des diagrammes de classes permettant de faire
de la schématisation DB.

```{.plantuml .column-split}
@startuml

' hide the spot
hide circle

' avoid problems with angled crows feet
skinparam linetype ortho

entity "Entity01" as e01 {
  *e1_id : number <<generated>>
  --
  *name : text
  description : text
}

entity "Entity02" as e02 {
  *e2_id : number <<generated>>
  --
  *e1_id : number <<FK>>
  other_details : text
}

entity "Entity03" as e03 {
  *e3_id : number <<generated>>
  --
  e1_id : number <<FK>>
  other_details : text
}

e01 ||..o{ e02
e01 |o..o{ e03

@enduml
```

 -  [Plus de détails: PlantUML - Entity Relationship](https://plantuml.com/ie-diagram)


## Types de diagrammes - Mind Map

```{.plantuml .column-split}
@startmindmap
+ OS
++ Ubuntu
+++ Linux Mint
+++ Kubuntu
+++ Lubuntu
+++ KDE Neon
++ LMDE
++ SolydXK
++ SteamOS
++ Raspbian
-- Windows 95
-- Windows 98
-- Windows NT
--- Windows 8
--- Windows 10
@endmindmap
```

 -  [Plus de détails: PlantUML - MindMap](https://plantuml.com/mindmap-diagram)

## Types de diagrammes - Gantt

Pour Cédric et autre gestionnaires:

```{.plantuml .column-split}
@startgantt
[Prototype design] lasts 13 days and is colored in Lavender/LightBlue
[Test prototype] lasts 9 days and is colored in Coral/Green and starts 3 days after [Prototype design]'s end
[Write tests] lasts 5 days and ends at [Prototype design]'s end
[Hire tests writers] lasts 6 days and ends at [Write tests]'s start
[Init and write tests report] is colored in Coral/Green
[Init and write tests report] starts 1 day before [Test prototype]'s start and ends at [Test prototype]'s end
@endgantt
```

 -  [Plus de détails: PlantUML - Gantt](https://plantuml.com/gantt-diagram)


## Types de diagrammes - WBS


```{.plantuml .column-split}
@startwbs
+ New Job
++ Decide on Job Requirements
+++ Identity gaps
+++ Review JDs
++++ Sign-Up for courses
++++ Volunteer
++++ Reading
++- Checklist
+++- Responsibilities
+++- Location
++ CV Upload Done
+++ CV Updated
++++ Spelling & Grammar
++++ Check dates
---- Skills
+++ Recruitment sites chosen
@endwbs
```

 -  [Plus de détails: PlantUML - Work Breakdown Structure](https://plantuml.com/wbs-diagram)


## Types de diagrammes - GUI Mock

Via *Salt*, on peut même faire du design d'interfaces graphique!

```{.plantuml .column-split}
@startsalt
{+
{* File | Edit | Source | Refactor 
 Refactor | New | Open File | - | Close | Close All }
{/ General | Fullscreen | Behavior | Saving }
{
	{ Open image in: | ^Smart Mode^ }
	[X] Smooth images when zoomed
	[X] Confirm image deletion
	[ ] Show hidden images 
}
[Close]
}
@endsalt

```

## Types de diagrammes - GUI State machine

Un autre example vraiment très intéressant permettant d'inclure *Salt*
à même un diagramme d'état. Je ne montrerai pas le code puisque trop
long, mais voici tout de même le résultat:

```{.plantuml}
@startuml
(*) --> "
{{
salt
{+
<b>an example
choose one option
()one
()two
[ok]
}
}}
" as choose
 
choose -right-> "
{{
salt
{+
<b>please wait
operation in progress
<&clock>
[cancel]
}
}}
" as wait
wait -right-> "
{{
salt
{+
<b>success
congratulations!
[ok]
}
}}
" as success
 
wait -down-> "
{{
salt
{+
<b>error
failed, sorry
[ok]
}
}}
"
@enduml
```

 -  [Plus de détails: PlantUML - Salt](https://plantuml.com/salt)


## Types de diagrammes - Dot

Puisque PlantUML dépend déjà de [Graphviz](https://www.graphviz.org/),
un support du language dot est offert.


```{.plantuml .column-split}
@startdot
digraph foo {
  node [style=rounded]
  node1 [shape=box]
  node2 [fillcolor=yellow, style="rounded,filled", shape=diamond]
  node3 [shape=record, label="{ a | b | c }"]

  node1 -> node2 -> node3
}
@enddot
```

 -  [Plus de détails: PlantUML - PlantUML - Dot](https://plantuml.com/ditaa)


## Types de diagrammes - Ditaa

Le diagram parfait pour les artistes ASCII. Via outil
[`ditaa`](http://ditaa.sourceforge.net/) installable et utilisable séparément.

```{.plantuml .column-split output=png}
@startditaa
+--------+   +-------+    +-------+
|        +---+ ditaa +--> |       |
|  Text  |   +-------+    |diagram|
|Document|   |!magic!|    |       |
|     {d}|   |       |    |       |
+---+----+   +-------+    +-------+
	:                         ^
	|       Lots of work      |
	+-------------------------+
@endditaa
```

 -  [Plus de détails: PlantUML - Ditaa](https://plantuml.com/ditaa)

