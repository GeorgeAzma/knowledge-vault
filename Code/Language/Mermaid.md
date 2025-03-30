### Graph Types
- **Graph / Flow Chart**
- **Pie Chart**
- **Sequence Diagram**
- **Gantt Chart**
- **Class Diagram**
### Graph Directions
- **TD** top down
- **BT** bottom to top
- **LR** left to right
- **RL** right to left
### Graph / Flow Chart
``` mermaid
flowchart LR
A1[Box] --> A2(Squircle) & A3((Circle)) --A--> A4{Diamond} <-->|B| A5[(Database)]
A1:::green
classDef green fill:#253,stroke:#269,stroke-width:2px;
```
### Class Diagram
``` mermaid
classDiagram
    Class <|-- AnotherClass : Parent
    class Class {
        String name
        getName()
    }
```
### Pie Chart
``` mermaid
pie
    title Pizza Toppings
    "Pepperoni" : 50
    "Mushrooms" : 20
    "Onions" : 15
    "Olives" : 15
```
### State Diagram
``` mermaid
stateDiagram-v2
    [*] --> Still
    Still --> [*]
    Still --> Moving
    Moving --> Still
```
### Sequence Diagram
``` mermaid
sequenceDiagram
    Alice->>Bob: Hello Bob, how are you?
    Bob-->>Alice: I am good thanks!
```
### Journey Map
``` mermaid
journey
    title A Day in the Life
    section Morning
      Go to work: 5: Me
      Arrive at work: 4: Me
    section Afternoon
      Lunch break: 3: Me
      Meeting: 4: Me
```
### Timeline
``` mermaid
timeline
    title My Life Timeline
    2000 : Born
    2010 : Moved to a new city
    2020 : Graduated

```
### Git Graph
``` mermaid
gitGraph
    commit
    branch develop
    commit
    commit
    checkout main
    commit
```
### Gantt Chart
``` mermaid
gantt
    title A Gantt Diagram
    dateFormat  YYYY-MM-DD
    section Section
    A task           :a1, 2024-11-01, 30d
    Another task     :after a1  , 20d
```
### Mind Map
``` mermaid
mindmap
  root
    Origin
      - Mental
      - Physical
```
