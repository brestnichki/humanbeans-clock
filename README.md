# clock

Humanbeans Flutter Clock Challenge Submission

## Concept:

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

We tested number of color combinations – each one individually on a phone screen in the middle of the room, walking around trying to imagine what it would feel like having this screen somewhere in your house. It was immediately apparent – as tempting as it was – we couldn’t really go with modern bright tones and Material Design palette. They work great for a screen you’re using at the moment but are too demanding for a clock face that you only want to know exists when you want to check the time.
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

![Outline of the custom font](https://humanbeans.dev/7.png)

We used Color Dodge blending mode to highlight the bird and create a glowing effect around it.

![Outline of the custom font](https://humanbeans.dev/7.png)

Animations:

![Outline of the custom font](https://humanbeans.dev/7.png)

Each time a minute passes a leaf is torn and flies away.

![Outline of the custom font](https://humanbeans.dev/7.png)

You can barely notice the branches moving.

![Outline of the custom font](https://humanbeans.dev/7.png)

Bird flies in and stays for a minute. It’s animation sequence is not predefined- it plays animations randomly. The bird can choose what to do next, making each time it appears a unique event.

## Development



## Reflection

“What I like most about this concept is that it is very easy to imagine a kid running to his parent shouting: „Quick the bird is here!”  - The clock can become an occasion for a positive interaction at home. “

Milen – designer

“Flutter is a great framework compared to my previous experience with android development. We were able to just start working on our idea and build on top of it as we moved along. A lot of things i struggled with before - animation orchestration and such was
just a breaze ih Flutter”

Bobby - developer
