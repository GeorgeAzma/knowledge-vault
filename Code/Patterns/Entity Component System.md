``` rust
let ref = Ref<EntityStore>;
let store = Store<EntityStore>;

let transform = store.get_component::<TransformComponent>(ref)
let position = transform.position();
position.set(100, 50, 20);

store.add_component(ref, TeleportComponent::new(7, 30, 42))
// System finds entities with TeleportComponent, 
// teleports them and removes the component
// this is called "component as trigger" patteern



```
