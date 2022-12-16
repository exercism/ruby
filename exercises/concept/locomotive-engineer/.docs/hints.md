# Hints

## General

- To extract multiple arguments in the function parameters so can you pack them with the `*arguments` operator for **array** or `**keyword_arguments` for keyword-based arguments.
- To pack or unpack use the splat operators (`*` or `**`).

## 1. Create an list of all wagons

- Multiple arguments in the function parameters can be packed with the `*arguments` operator.

## 2. Fix the list of wagons

- Using unpacking with the splat operator(`*`), lets you extract the first two elements of an **array** while keeping the rest intact.
- To add another **array** into an existing **array**, you can use the splat operator (`*`) to "spread" the **array**.

## 3. Add missing stops

- Using `**keyword_arguments` as a method argument will allow an arbitrary amount of keyword arguments to be passed.
- Using `**<hash>` as an argument will unpack a `Hash` into keyword arguments.
- You can put keyword arguments in a `{}`, which is another way to create a `Hash`.
- To get the values out of a `Hash`, you can use the `Hash#values` method.

## 4. Extend routing information

- Using `**{some_hash: value}` as an argument will unpack the `Hash` into keyword arguments.

