# Types de diagrammes UML

## Types de diagrammes - Sequence

```{.plantuml .column-split}
@startuml
hide footbox
actor user
participant webfrontend
participant webserver
participant hwdevice
participant os

user -> hwdevice ++ : power on
hwdevice -> hwdevice ++: boot process
hwdevice -> os ++: boot loader
os -> webserver **: launch
activate webserver
return success
os -> webfrontend **: launch
activate webfrontend
webfrontend -> webserver ++: request html ui
return html ui
webfrontend --> os : success
deactivate webfrontend
@enduml
```

## Types de diagrammes - Sequence (suite)

```{.plantuml .column-split}
@startuml
hide footbox
actor user
participant webfrontend
participant webserver
participant hwdevice
participant os

user ->> webfrontend ++: click on process button
webfrontend -> webserver ++: request processing result
webserver -> hwdevice ++: request sensor state\nsample (camera, etc)
return sensors states
webserver -> webserver ++: process sensor states
return result
webfrontend -> webfrontend ++: render into images
return images
webfrontend ->> user: images as light
@enduml
```

 -  [Plus de détails: PlantUML - Sequence](https://plantuml.com/sequence-diagram)


## Types de diagrammes - Class

```{.plantuml .column-split}
@startuml
interface Animal {
    +get_name(): str
    +get_legs(): Leg[]
}

class Leg
class Fin
class Dog {
    +barks()
}
class Master: {
    +run()
}

Animal <|-- Dog: inherits
Animal <|-- Dolphin: inherits
Lion -|> Animal: inherits

Lion o--> "0-1" Dog: hold in its mouth
Lion o--> "0-1" Master: hold in its mouth
Dog *--> "4" Leg: has
Dolphin *--> "0" Leg
Dolphin *--> "1" Fin

Dog ..> Master: depends on its
@enduml
```

 -  [Plus de détails: PlantUML - Class](https://plantuml.com/class-diagram)


## Types de diagrammes - Activity



```{.plantuml .column-split}
@startuml
start
-> <u>**Systemd supports parallel boot!**</u>;
partition "System Boot" {
  fork
    partition "Update System" {
      if (requires updates?) then
        repeat :Download <u>*app*</u> update package;
        repeat while (not ok and retry count\nnot exhausted)
        if (download package?) then
          -[#green]->
          :Installing new <u>*app*</u> package;
        else
          -[#red]-> Cannot proceed, this is not safe!
          **shuting down** the system...;
          end
        endif
      endif
    }
  fork again
    :Launching postgres db;
    :Launching application backend;
  end fork
}
:Lauching application;
stop
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
state "Awaiting input" as State1
state "Looking for matches" as State2
state "Processing selection" as State4

[*] -> State1
State1 --> State2 : Input received
State1 --> [*] : Timeout
State2 --> State1 : No matches / To many matches
State2 --> State4 : Single match
State2 --> State3 : Multiple maches found
state State3 {
  [*] --> State3A
  state "CursorOnMatch1" as State3A
  state "CursorOnMatch2" as State3B
  State3A --> State3B: Arrow down
  State3A --> [*]: Enter / Esc / Ctrl+c
  State3B --> State3A: Arrow up
  State3B --> [*]: Enter / Esc / Ctrl+c
}

State3 --> [*] : Selection rejected / Aborted
State3 --> State4 : Single match selected
State4 --> [*]: Done
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

