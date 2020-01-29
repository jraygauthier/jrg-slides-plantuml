# Types de diagrammes UML

## Types de diagrammes - Sequence

```{.plantuml .column-split}
@startuml
alice -> bob ++ : hello
bob -> bob ++ : self call
bob -> bib ++  #005500 : hello
bob -> george ** : create
return done
return rc
bob -> george !! : delete
return success
@enduml
```

 -  [Plus de détails: PlantUML - Sequence](https://plantuml.com/sequence-diagram)


## Types de diagrammes - Class

```{.plantuml .column-split}
@startuml
Object <|-- ArrayList

Object : equals()
ArrayList : Object[] elementData
ArrayList : size()

@enduml
```

 -  [Plus de détails: PlantUML - Class](https://plantuml.com/class-diagram)


## Types de diagrammes - Activity

```{.plantuml .column-split}
@startuml
:foo1;
-> You can put text on arrows;
if (test) then
  -[#blue]->
  :foo2;
  -[#green,dashed]-> The text can
  also be on several lines
  and **very** long...;
  :foo3;
else
  -[#black,dotted]->
  :foo4;
endif
-[#gray,bold]->
:foo5;
@enduml
```

 -  [Plus de détails: PlantUML - Activity](https://plantuml.com/activity-diagram-beta)


## Types de diagrammes - Timing

```{.plantuml .column-split}
@startuml
robust "Web Browser" as WB
concise "Web User" as WU

WB is Initializing
WU is Absent

@WB
0 is idle
+200 is Processing
+100 is Waiting
WB@0 <-> @50 : {50 ms lag}

@WU
0 is Waiting
+500 is ok
@200 <-> @+150 : {150 ms}
@enduml
```

 -  [Plus de détails: PlantUML - Timing](https://plantuml.com/timing-diagram)


## Types de diagrammes - State

```{.plantuml .column-split}
@startuml
scale 350 width
[*] --> NotShooting

state NotShooting {
  [*] --> Idle
  Idle --> Configuring : EvConfig
  Configuring --> Idle : EvConfig
}

state Configuring {
  [*] --> NewValueSelection
  NewValueSelection --> NewValuePreview : EvNewValue
  NewValuePreview --> NewValueSelection : EvNewValueRejected
  NewValuePreview --> NewValueSelection : EvNewValueSaved
  
  state NewValuePreview {
    State1 -> State2
  }
  
}
@enduml
```

 -  [Plus de détails: PlantUML - State](https://plantuml.com/state-diagram)


## Types de diagrammes - Use Case

```{.plantuml .column-split}
@startuml
left to right direction
skinparam packageStyle rectangle
actor customer
actor clerk
rectangle checkout {
  customer -- (checkout)
  (checkout) .> (payment) : include
  (help) .> (checkout) : extends
  (checkout) -- clerk
}
@enduml
```

 -  [Plus de détails: PlantUML - Use Case](https://plantuml.com/use-case-diagram)


## Types de diagrammes - Component

```{.plantuml .column-split}
@startuml

package "Some Group" {
  HTTP - [First Component]
  [Another Component]
}
 
node "Other Groups" {
  FTP - [Second Component]
  [First Component] --> FTP
} 

cloud {
  [Example 1]
}


database "MySql" {
  folder "This is my folder" {
	[Folder 3]
  }
  frame "Foo" {
	[Frame 4]
  }
}


[Another Component] --> [Example 1]
[Example 1] --> [Folder 3]
[Folder 3] --> [Frame 4]

@enduml
```

 -  [Plus de détails: PlantUML - Component](https://plantuml.com/component-diagram)


## Types de diagrammes - Autres UML

Voici d'autres diagrammes que je n'ai pas encore eu l'occasion ou trouvé le
besoin d'utiliser:

 -  [Plus de détails: PlantUML - Deployment](https://plantuml.com/deployment-diagram)
 -  [Plus de détails: PlantUML - Object](https://plantuml.com/object-diagram)
 -  [Plus de détails: PlantUML - All diagram types](https://plantuml.com/)

