# Eventually

Humanbeans Flutter Clock Challenge Submission

by Milen Trendafilov (design, concept) and Boris Brestnichki (development)

## Concept:

![The clock with the rare bird comming from the right and sitting on a branch for 1 minute](https://humanbeans.dev/1_Bird_Visit1.gif)

Bird visits Only once a day and stays for only one minute. You may not see it for weeks, sometimes you’ll only catch a glimpse of it flying away.

But sometimes you and the bird will share a special moment. Make a wish, call someone from the other room to show them, or do nothing – it’s your special minute!

## Concept Story:

Approaching the competition, we knew we wanted to take one step further than creating a good looking clock face that works. It was important we utilized as much of the features flutter has as we could, but we didn’t want technology to be the end goal.
We wanted it to be the means we used to express an idea, a story an allegory…something!

We started brainstorming around few concepts. Going through books about watches, graphic design and art – writing down, taking photos of anything that might turn out to be useful.

Watch makers have had some incredible ideas in the past – creating scenes with insanely complicated mechanically propelled characters, even games – a special experience beyond just telling time.

We needed a graphic approach so a lot of pages were turned until a poster by Armando Milani came along called “World peace” showing a bird silhouette.

Suddenly It all came together. We had already been through ideas about introducing a character to the scene – what if it was bird that visits every once in a while? What if it was a really special bird?
This could be a whole new version of the cuckoo clock!

## Design:

First step was testing the colors.

![Grid with multiple color combinations for the clock design](https://humanbeans.dev/3.png)

We tested a number of color combinations – each one individually on a phone screen in the middle of the room, walking around trying to imagine what it would feel like having this screen somewhere in your house. It was immediately apparent – as tempting as it was – we couldn’t really go with modern bright tones and Material Design palette. They work great for a screen you’re using at the moment but are too demanding for a clock face that you only want to know exists when you want to check the time.

So dark theme and pastel colors were the obvious choice.

![Grid showing warm and cold combinations of dart pastel colors](https://humanbeans.dev/4.png)

We used Paul Gauguin’s (a favorite artist) paintings to gather initial colors to test. Gauguin’s colors are just perfect for our purposes as he created vivid color themes before humanity was able add light as a compound to color.

We finally had a color theme we were happy with – not distracting if you’re not looking at it, but still readable, regardless of light intensity or screen lighting.

Fonts were another great challenge. We soon found out all fonts we tested had similar problems – huge gaps opened up whenever the clock had to show numbers 1 and 7 and 4.

We came up with the idea to displace the numbers, hoping the dynamic would compensate this, but still some number combinations created huge empty spaces that distorted the balance of the design:

![Rough design of the app with highlight of big space between narrow and thick numbers on a default font](https://humanbeans.dev/6.png)

We knew we had to create our own font. We found using playful characters we could tilt the character stems – with each letter leaning in a different direction – empty spaces would not be as apparent:

![Outline of the custom font](https://humanbeans.dev/5.png)
![The custom font in the context of the app. The narrow characters are tilted to offset the problem with big spaces around them](https://humanbeans.dev/7.png)

Playful characters worked better in a lot of cases we previously had problems with.

Finally, the bird showing up needed to be a special occasion. We didn’t want it to go unnoticed – it is the one exception to our “no distraction” rule as our whole concept revolved around the bird being special.

![The bird has glowing halo around it](https://humanbeans.dev/Bird_Glow.gif)

We used Color Dodge blending mode to highlight the bird and create a glowing effect around it.

Animations:

![Numbers of the clock changing and one leaf flying away](https://humanbeans.dev/2_Leaf_Torn.gif)

Each time a minute passes a leaf is torn and flies away.

![Branches moving lightly as if blown by air](https://humanbeans.dev/3_Branches_Moving.gif)

You can barely notice the branches moving.

![The clock with the rare bird comming from the right and sitting on a branch for 1 minute](https://humanbeans.dev/1_Bird_Visit1.gif)

Bird flies in and stays for a minute. Its animation sequence is not predefined- it plays animations randomly. The bird can choose what to do next, making each time it appears a unique event.

## Development

### Development

The app is build as mush as possible for me without library widgets. The main exception being the bird animation, as it's more complex. For that we relied on Flare's animations.

Another great help in both teaching myself about organizing animations was Supernova's package for flutter. The animation structure in the app is strongly infuenced by their work, 
even though i created it for myself form start. 

The overall performance of the framework is great, we have more around 30 moving elements on the screen during most of the time and we have achieved 40 fps on my Samsung S6 Active.

I strongly suspect there's a room for improvement in the "performance department" but i could not find a way to do it. 

The app uses InheritedModel to communicate changes in state to child widget, which allow us to avoid rebuilds for most of them, but keep all the logic for the animations, in the
root widget of the app.

For the accessibility of the app we had some consideration. I have disabled font scaling for the time numbers, because i believe that the 159 (baseline) for the font should be 
able to provide readability. The root of the app in the Clock widget we use ExclideSematics widgets to remove all the semantics for the decoration elements - the bird and the 
branches/leaves. That also excludes the text for the clock time, but i wrapped everything in Semantics providing label for the current time.

### Dependancies and licensing

The licensing of the project can be found in [LICENCE.md](https://github.com/brestnichki/humanbeans-clock/blob/master/LICENSE.md).

The project depends on the following packages. The licensing for the packages can be found in the links below:

* [intl](https://pub.dev/packages/intl): License [BSD](https://github.com/dart-lang/intl/blob/master/LICENSE);
* Flutter: License [BSD 3-Clause "New" or "Revised" License](https://github.com/flutter/flutter/blob/master/LICENSE);
* [supernova_flutter_ui_toolkit](https://pub.dev/packages/supernova_flutter_ui_toolkit): License [MIT](https://github.com/Supernova-Studio/flutter-ui-toolkit/blob/master/LICENSE);
* [flare_flutter](https://pub.dev/packages/flare_flutter): License [MIT](https://github.com/2d-inc/Flare-Flutter/blob/master/LICENSE);
* [path_provder](https://pub.dev/packages/path_provider): License [BDS](https://github.com/flutter/plugins/blob/master/packages/path_provider/LICENSE);
* [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons): License [MIT](https://github.com/fluttercommunity/flutter_launcher_icons/blob/master/LICENSE);

## Reflection

“What I like most about this concept is that it is very easy to imagine a kid running to his parent shouting: „Quick the bird is here!”  - The clock can become an occasion for a positive interaction at home. “

Milen – designer

“Flutter is a great framework compared to my previous experience with android development. We were able to just start working on our idea and build on top of it as we moved along. A lot of things i struggled with before - animation orchestration and such was
just a breeze in Flutter”

Bobby - developer
