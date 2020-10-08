+++
title = "Bodies"
description = ""
weight = 1
+++

Bodies define the physics boundaries of objects. They can be assigned to entities in scenes or prefabs. Users can edit the Body Flags to change their behaviour.

##### Body Flags

* Two Sided: Forces the physics engine to use both sides of the polygons for this body.
* AI Limiter: Used to tag bodies which will only used against AI agents, excluding the player.
* Destructible Door: Used by the automatic navigation mesh generator to not put nav mesh under destructable doors.
* Disabled: Disables the physics for this prefab or entity instance.
* Barrier: Enables smooth exit for agents exiting the interior of the body.
* Exclude Path Snap: Path points does not snap to these bodies.
* Don't Collide With Camera: Camera for the player does not collide with these bodies.
* Dynamic: Physics engine simulates the movement of this entity.
* Moveable: This flag indicates that this body and its owner entity can move. 
* Ladder: Should be given to the ladder meshes so that they function properly.
* Has Steps: Should be given to the bodies of the staircases so that the agent can climb them correctly. (The body of the stairs should be seperated from the other parts of the entity).

Agent physics require smooth and low poly physics objects for performance. Missile ones require more precision so that the stuck missiles are simulated better. The below flags can be used to have two different bodies per object which is the best of both worlds. If none of the flags are given, both missiles and agents react to the bodies.
	
* Agent Only: Only the agents react into these bodies.
* Missile Only: Only the missiles react into these bodies.


##### Occluders

Occluders are bodies which are placed at mesh surfaces to tell the rendering system to not render the contents on the other side of that surface. They do not contribute to the physics simulation. Big towns and villages benefit largely from carefully placed occluders. User can place occluders directly to the scene or attach them to entities & prefabs. 

{{% notice info %}}
The imported occluder bodies names should start with "occ_" phrase.
{{% /notice %}}