+++
title = "Meshes"
description = ""
weight = 1
+++

Meshes contain the polygon positions and attributes to be used at the rendering pass. Every mesh has one material that defines their rendering behaviour. They are grouped inside MetaMesh's by their LOD level. Also, at the same LOD level, there can be multiple meshes with different materials. More information about importing meshes to the engine can be found at <strong>[Naming Conventions]({{< ref "asset_naming_conventions.md" >}})</strong>.


##### LOD System

Modern engines use LOD(level of detail) systems to ensure that the amount of GPU share used by the closer parts of the screen is more than the far ones. This is done by reducing the mesh qualiy with respect to the distance to the camera. This system ensures that the polygon per pixel ratio is similar across the screen as much as possible. The default LOD distances are as follows: 15, 22.5, 30, 50, 70, 130, 210 meters. These distances are for the best graphics quality and they can be reduced via the Environment Quality and Character Quality options.

 