+++
title = "Sealed Class Extension"

[menu.main]
identifier = "sealed_class_extension"
parent = "bestpractices"
+++


It has been brought to our attention that a workaround to extend sealed classes is requested by some of our modders. In this article we will be exploring why there are sealed classes in the game codes and how to achieve extended behavior for them.

One of the main reasons we have made fundamental classes sealed is to allow the codebase to support a broad range of mods that can operate simultaneously as best as possible. In order to achieve this, and as software engineering principles dictate, we encourage mods to be built as self contained, modular extensions to the code such as Campaign Behaviors, Game Models and custom classes or components, that can be added or removed without any complications. Inheriting from core campaign classes increases the likelihood of conflicts with other mods and future official updates by changing class hierarchies and may lead to custom tailored alterations to fundamental game logic. Although it is possible to write careful code that avoids these issues, we decided to adhere to these standards in our codebase and reduce the possibility of conflict from either internal or external sources altogether.

When it comes to achieving extended behavior for sealed classes without inheritance, although various workarounds might be explored, one possible solution is discussed below. 

In essence, when the problem of extending sealed classes is broken-down, there are two main requirements to address, namely adding new behavior and adding new properties.

In order to add new behavior to sealed classes, a C# feature called “extension methods” can be utilized. In a nutshell, it enables you to add new methods to any class without deriving a new type or modifying the original one. For more information on extension methods, you can visit here.

Adding a new property can be achieved by associating a sealed class instance with a corresponding property value using a dictionary. When combined with extension methods, the sealed class can provide the interface to the new property as if it was added directly to the class.

```C#
    public class HeroManaExtensionCampaignBehavior : CampaignBehaviorBase
    {
        private Dictionary<Hero, float> _heroManaValues = new Dictionary<Hero, float>();
    
        public float GetMana(Hero hero)
        {
            if(_heroManaValues.TryGetValue(hero, out float result))
            {
                return result;
            }            
			
            return 0; //default value
        }

        public void SetMana(Hero hero, float newValue)
        {
            _heroManaValues[hero] = newValue;
        }

        public override void RegisterEvents(){ }        
        public override void SyncData(IDataStore dataStore)
        {
            dataStore.SyncData("_heroManaValues", ref _heroManaValues);
        }
    }

    public static class HeroManaExtensions
    {         
        public static float GetMana(this Hero hero)
        {
            var behavior = Campaign.Current.GetCampaignBehavior<HeroManaExtensionCampaignBehavior >();
            return behavior.GetMana(hero);
        }

        public static void SetMana(this Hero hero, float newMana)
        {
            var behavior = Campaign.Current.GetCampaignBehavior<HeroManaExtensionCampaignBehavior >();

            behavior.SetMana(hero, newMana);
        }
    }

```

While this solution is a viable workaround to extend sealed classes, it is important to remember that each project has different requirements and consequently you should explore what approach works best for your code.
