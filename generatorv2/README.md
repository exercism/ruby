# Generator

Last Updated: 2024/11/9

The generator is a powerful tool that can be used to generate tests for exercises based on the canonical data.
The generator is written in Ruby and is located in the `bin` directory.

## How to use the generator

### Things to do before running the generator

Run `bundle install` to install the required libraries.
Before running the generator you have to make sure a couple of files are in place.

1. `tests.toml` file

It is located under the `.meta` folder for each exercise.
The toml file is used to configure which exercises are generated and which are not.
Since the generator grabs all the data from the canonical data, so does this enable new tests that won't automatically be merged in.
Instead so does new tests have to be added to the toml file before they show up in the test file.

If there is a test that isn't needed or something that doesn't fit Ruby you can remove it from the toml file.
By writing after the test name `include = false` and it will be skipped when generating the test file.

2. `config.json` file, located in the root of the track

The generator makes sure that the exercise is in the config.json so you need to add it there before running the generator.

#### Things to note

The script which grabs info from the toml file is quite sensitive, writing the toml file in an incorrect way can brick the generator.

Here are some examples of how you should **NOT** work with the toml file.

Make sure that the uuid is the only thing inside of `[uuid]`, if there is, for example, an extra space so would that break it.
Here is an example

```toml
# This would break it since it is an extra space between uuid and `]`
[1e22cceb-c5e4-4562-9afe-aef07ad1eaf4 ]
# This would break it since it is an extra space between uuid and `[`
[ 1e22cceb-c5e4-4562-9afe-aef07ad1eaf4]
```

The script won't care if you write `include = true` since if it sees the uuid it will always take it as long as `include = false` is not written.
The script will not work if anything is misspelled, although the part which gets `include = false` doesn't care if it gets an extra space or not.

**NOTE:**
You are also **NOT** allowed to write `include = false` more than once after each uuid.
Since that can lead to errors in the generator.

Bad way:

```toml
[1e22cceb-c5e4-4562-9afe-aef07ad1eaf4]
description = "basic"
include = false
include = false
```

Good way:

```toml
[1e22cceb-c5e4-4562-9afe-aef07ad1eaf4]
description = "basic"
include = false
```

### Template

The generator uses a template file to generate the test file.
The template is located under the `.meta` for each exercise.

This template has to be manually written for each exercise.
The goal although is to make it so that you only have to write the template once and then it will be able to be used to generate new tests.

The template file is written in [Embedded Ruby(ERB)][erb].
ERB enables you to write Ruby code inside of the template file.
It also means that the templates can be highly customizable since you can write any Ruby code you want.

When writing the template file it is recommended to look at already existing template files to get a better understanding of how it works.
The template is getting a slightly modified version of the canonical data, so you can check out the [canonical data][canonical data] to see the data structure.
The modification is that the cases which are not included in the toml file will be removed from the data structure.

When writing the template so is it a special tool that can help with giving `# skip` and `skip` tags for tests.
You simply have to call the `status` method.
It will return either `# skip` or `skip` depending on if it is the first test case or not.

Here is an example:

```
<%= status()%>
<%= status()%>
<%= status()%>
```

result:

```
# skip
skip
skip
```

### The Test Generator

If all the earlier steps are done so can you run the generator.
To run the generator you need to have a working Ruby installation and installed all gems in the Gemfile.
The generator is located in the `bin` directory and is called `generator.rb`.

To run the generator so do you have to be in the root directory and run the following command:

```shell
bundle exec ./bin/generate -e <exercise_slug>
```

Where `<exercise_slug>` is the same name as the slug name which is located in the `config.json` file.

For more commands so can you run the following command:

```shell
bundle exec ./bin/generate --help
```

### Errors and warnings

The generator will give you errors and warnings if something is wrong.
That includes if the exercise is not in the `config.json` file, if the exercise is not in the toml file, or if the template file is missing.
Also if it has a problem getting the `canonical-data.json` file so will it give you an error.
The generator also uses a formatter which will give you errors if the generated file is not formatted correctly.
The file will still be generated even if formatter gives errors, therefore can you check the file and see what is wrong and fix it in the template.

[erb]: https://docs.ruby-lang.org/en/master/ERB.html
[canonical data]: https://github.com/exercism/problem-specifications
