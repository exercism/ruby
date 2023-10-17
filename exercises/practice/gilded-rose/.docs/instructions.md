# Instructions

Hi, and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a prominent city run by a friendly innkeeper named Allison. We also buy and sell only the finest goods. Unfortunately, our goods are constantly degrading in quality as they approach their sell-by date. We have a system in place that updates our inventory for us. It was developed by a no-nonsense type named Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that we can begin selling a new category of items.

First, an introduction to our system:

- All items have a `sell_in` attribute, which denotes the number of days we have to sell the item.
- All items have a `quality` attribute, which denotes how valuable the item is.
- At the end of each day, our system lowers both values for every item.

Pretty simple, right? Well, this is where it gets interesting:

- Once the sell-by date has arrived, quality degrades twice as fast.
- The quality of an item is never negative.
- **_Aged Brie_** actually *increases* in quality the older it gets.
- The quality of an item is never more than 50.
- **_Sulfuras_**, being a legendary item, does not have a sell-by date, and it has a quality of 80 which never decreases.
- **_Backstage passes_**, like **_Aged Brie_**, increase in quality as their sell-by date approaches: quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less, but quality drops to 0 after the concert.

We have recently signed a supplier of **_Conjured_** items. This requires an update to our system:

- **_Conjured_** items degrade in quality twice as fast as normal items.

Feel free to make any changes to the `GildedRose#update!` method and add any new code as long as everything still works correctly. However, do not alter `Item` because it belongs to the goblin in the corner who will insta-rage and one-shot you, as he doesn't believe in shared code ownership.
