# Instructions

Welcome to the engineering team at the Gilded Rose!
As you know, we're an inn that buys and sells only the finest goods.
Our goods are constantly degrading in quality as they approach their sell-by date, so we have an inventory system that keeps track of these data.

We need you to add a new feature to our system so that we can begin selling a new category of items.
However, the code is a mess, and it will be difficult to add the new feature unless you first refactor the existing code.

So your task is twofold: refactor the inventory system, then add the new feature.

## Overview of the inventory system

Here are the basics of our system:

- All items have a "sell in" attribute, which denotes the number of days we have to sell the item.
- All items have a "quality" attribute, which denotes how valuable the item is.
- At the end of each day, our system lowers both values for every item.

Pretty simple, right? Well, this is where it gets interesting:

- Once the sell-by date has arrived, quality degrades twice as fast.
- The quality of an item is never negative.
- **_Aged Brie_** actually *increases* in quality the older it gets.
- The quality of an item is never more than 50.
- **_Sulfuras_**, being a legendary item, does not have a sell-by date, and it has a quality of 80 which never decreases.
- **_Backstage passes_**, like **_Aged Brie_**, increase in quality as their sell-by date approaches: quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less, but quality drops to 0 after the concert.

## 1. Refactor

To pave the way for the new feature, refactor the existing code and make it easier to change.

Feel free to make any changes and add any new code as long as everything still works correctly (i.e., as long as the tests for existing features still pass).

## 2. Add the new feature

We have recently signed a supplier of **_Conjured_** items.
Your job is to add the following rules to our system:

- **_Conjured_** items degrade in quality twice as fast as they would otherwise. However, special rules apply for conjured items that are not normal items:
  - **_Conjured Aged Brie_** is like a non-conjured Aged Brie, with one difference: when its sell-by date has arrived, instead of its quality increasing faster, its quality _decreases_ at the rate of a conjured normal item.
  - **_Conjured Sulfuras_** is like a non-conjured Sulfuras, with two differences: (1) it has a sell-by date, and (2) like the Conjured Aged Brie, once the sell-by date has arrived its quality decreases at the rate of a conjured normal item.
  - **_Conjured backstage passes_** increase in quality by 1 less than if they were not conjured.
