# About

The key thing to remember about Ruby strings is that they are objects that you call methods on. You can find all the methods in the [Ruby docs][ruby-doc.org-string]

It's also worth knowing that strings can be created using single quotes (`'`) or double quotes (`"`). Single-quoted strings don't process ASCII escape codes(\n, \t etc.), and they don't do [string interpolation][ruby-for-beginners.rubymonstas.org-interpolation] while double-quoted does both.

You can also create strings using the [heredoc syntax][ruby-heredoc] or using the `%q` and `%Q` helpers.

[ruby-for-beginners.rubymonstas.org-interpolation]: http://ruby-for-beginners.rubymonstas.org/bonus/string_interpolation.html
[ruby-doc.org-string]: https://ruby-doc.org/core-2.7.0/String.html
[ruby-heredoc]: https://www.rubyguides.com/2018/11/ruby-heredoc/
