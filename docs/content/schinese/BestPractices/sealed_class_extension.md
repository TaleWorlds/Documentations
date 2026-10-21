+++
title = "密封类(Sealed Class)的扩展"
ai_translated = true

[menu.main]
identifier = "sealed_class_extension"
parent = "bestpractices"
+++


我们注意到,一些模组制作者希望找到一种变通方法来扩展密封类(sealed class)。在本文中,我们将探讨为什么游戏代码中存在密封类,以及如何为它们实现扩展行为。

我们将基础类设为密封类的主要原因之一,是为了让代码库能够尽可能好地支持可以同时运行的广泛模组。为了实现这一点,并且按照软件工程原则的要求,我们鼓励将模组构建为独立的、模块化的代码扩展,例如 Campaign Behaviors(战役行为)、Game Models(游戏模型)或自定义类/组件,这些扩展可以在不产生任何复杂问题的情况下添加或移除。从核心战役类继承会通过改变类层次结构增加与其他模组及未来官方更新发生冲突的可能性,并可能导致对基础游戏逻辑进行定制化的改动。尽管编写谨慎的代码是可以避免这些问题的,但我们仍决定在我们的代码库中坚持这些标准,从而从根本上降低来自内部或外部来源的冲突可能性。

说到在不使用继承的情况下为密封类实现扩展行为,虽然可以探索多种变通方法,但下面将讨论其中一种可能的解决方案。

从本质上讲,当我们拆解扩展密封类这一问题时,有两个主要需求需要解决,即添加新行为和添加新属性。

为了给密封类添加新行为,可以利用一个名为"扩展方法(extension methods)"的 C# 特性。简而言之,它使你能够在不派生新类型或修改原始类型的情况下,为任意类添加新方法。有关扩展方法的更多信息,你可以访问[此处](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/classes-and-structs/extension-methods)。

添加新属性可以通过使用字典(dictionary)将密封类的实例与对应的属性值关联起来实现。当与扩展方法结合使用时,密封类就可以提供一个接口,使新属性看起来就像是直接添加到该类中一样。

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

虽然这种解决方案是扩展密封类的一种可行的变通方法,但重要的是要记住,每个项目的需求都不尽相同,因此你应该探索哪种方法最适合你的代码。
</content>
