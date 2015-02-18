Rufregle
==================
[![Version         ](http://img.shields.io/gem/v/rufregle.svg)                               ](https://rubygems.org/gems/rufregle)[![Build Status](https://travis-ci.org/CristianOliveiraDaRosa/rufregle.svg)](https://travis-ci.org/CristianOliveiraDaRosa/rufregle)
---
Ruby Free Google Translate gem or Rufregle

Simple unofficial free google translate library.

#How it works?

It uses an alternative google url to request the translate that's why this lib may have performance issues.
Recommended to use only in prototypes applications.

###Is it free?

Yes.

###Should I use it in my Production Application?

Maybe. You need performance?


#Using
More simple than that?

Installing gem
```
$  gem install rufregle

```

Using on code:
```
result = Rufregle.new.translate("Hello World", "en", "pt")
p "#{result}"
```

Contributing
===
1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request

After that include your name in "Authors" section!

License
====
  This project is under MIT licence

Authors
=====

Cristian Oliveira - www.cristianoliveira.com.br
