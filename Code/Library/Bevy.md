### ECS
#### Component
``` rust
#[derive(Component)]
struct Player;

#[derive(Component)]
struct Health(f32);
```
###### Bundle
``` rust
#[derive(Bundle)]
struct PlayerBundle {
    player: Player,
    health: Health,
    bundle: AnotherBundle,
}
```
###### Query
``` rust
fn system(query: Query<&Health>) {}
fn system(mut query: Query<&mut Health>) {}
fn system(query: Query<(&Player, Option<&Health>)>) {}
fn system(query: Query<(Entity, &Player>) {} // Entity always exists, used for id
```
###### Filter
``` rust
Query<&Health, With<Player>>
Query<&Health, Without<Enemy>>
Query<&Health, Or<(Player, Enemy)>>
Query<&Health, AnyOf<(Player, Enemy)>>
Query<&Health, Not<With<Player>>>

query.single()?; // single entity
query.single_mut()?; // single mutable entity
query.get_mut(entity) // specific entity
```
###### Change Detection
``` rust
Query<(Player, Score), Added<Health>>
Query<(Player, Score), Removed<Health>>
Query<(Player, Score), Changed<Health>>
```
#### Entity
``` c
let entity = commands.spawn((Player, Health(100.0))).id();
commands.entity(entity).insert(Score(0));
commands.entity(entity).remove::<Health>();
commands.entity(entity).despawn();
```
#### System
``` rust
app.add_systems(Startup, setup);
app.add_systems(Update, (move_player, animate_player)); // executed in parallel
```
###### Schedule
``` rust
Startup
PreStartup
Update
FixedUpdate
PostUpdate
```
###### Per System Persistent State
``` rust
fn system(mut counter: Local<u32>) {
    *counter += 1;
}
```
###### Conditional Systems
``` rust
app.add_systems(Update, (
    my_system.run_if(resource_exists::<GameConfig>),
    my_system.run_if(|time: Res<Time>| time.elapsed_secs() > 0.0),
    my_system.run_if(in_state(GameState::Playing)),
));
```
###### System Ordering
``` rust
app.add_systems(Update, (
    input,
    movement.before(render),
    render.after(movement),
));

app.add_systems(Update, 
    (input, movement, render).chain() // input -> movement -> render
);
```
###### System Set
``` rust
// simplifies system.before((system_a, system_b)) -> system.before(system_set) 

#[derive(SystemSet, Debug, Hash, PartialEq, Eq, Clone)]
enum GameplaySet {
    Input,
    Movement,
    Combat,
}

app.configure_sets(
    Update,
    (
        GameplaySet::Input,
        GameplaySet::Movement,
        GameplaySet::Combat,
    ).chain(),
);

app.add_systems(Update, input.in_set(GameplaySet::Input));
app.add_systems(Update, movement.in_set(GameplaySet::Movement));
app.add_systems(Update, combat.in_set(GameplaySet::Combat));

app.add_systems(
    Update,
    movement // system in multiple system sets
        .in_set(GameplaySet::Movement)
        .in_set(PhysicsSet::Sync),
);
```
### Resource
``` rust
#[derive(bevy_ecs::Resource)]
struct Score(u32);

app.insert_resource(Score(0));

fn system(score: Res<Score>) {}  
  
fn system_mut(mut score: ResMut<Score>) {  
    score.0 += 1;  
}

commands.insert_resource(Score);  
commands.remove_resource::<Score>();
```
### Plugin
``` rust
pub struct MyPlugin;

impl Plugin for MyPlugin {
    fn build(&self, app: &mut App) {
        app.add_systems(Update, my_system)
           .insert_resource(MyResource);
    }
}

app.add_plugins((
    MyPlugin,
    OtherPlugin,
));
```
### Event
``` rust
#[derive(Event)]
struct DamageEvent {
    amount: f32,
}

app.add_event::<DamageEvent>();
app.add_observer::<DamageEvent>();

// runs when DamageEvent is triggered
fn on_damage(trigger: On<DamageEvent>) {
    println!("{}", trigger.amount);
}

fn system(mut writer: EventWriter<DamageEvent>) {
    writer.write(DamageEvent {
        amount: 10.0,
    });
}

// EventWriter/EventReader are buffered and processed later in frame (delayed)
fn system(mut reader: EventReader<DamageEvent>) {
    for ev in reader.read() {
        println!("{}", ev.amount);
    }
}

// does not run on DamageEvent, but if system is already running, gets triggered damage event data
fn on_damage(trigger: Trigger<DamageEvent>) {
    println!("{}", trigger.amount);
}

app.add_observer(on_damage);

commands.trigger(DamageEvent {
    amount: 10.0,
});
commands.trigger_targets(
    DamageEvent { amount: 10.0 },
    entity,
);

commands.observe(on_damage); // on_damage runs when DamageEvent happens 
```
### State
``` rust
#[derive(States, Default, Clone, Eq, PartialEq, Hash)]
enum GameState {
    #[default]
    Menu,
    Playing,
}

app.init_state::<GameState>();

app.add_systems(
    Update,
    gameplay.run_if(in_state(GameState::Playing)),
);

next_state.set(GameState::Playing);
```
### Command Buffers
``` rust
// deferred execution
commands.spawn(...);
commands.insert_resource(...);
commands.trigger(...)
```
### Execution
1. begin frame
2. execute systems `parallel, with dependencies using .before()/.after()`
    - mutate entities/components
    - dispatch triggers
    - write events
    - read events `from previous frame (double buffered)`
3. flush command buffer
    - apply entity/component mutations
    - execute triggers
4. event queue swap
5. next frame
