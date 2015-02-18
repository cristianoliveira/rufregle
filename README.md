Rufregle
==================
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
 gem install rufregle
 
```

Using on code:
```
    result = Rufregle.translate("Hello World", "en", "pt")
    p "#{result[0]}"
```

License
====
  This project was made under MIT licence

Authors
=====

Cristian Oliveira - www.cristianoliveira.com.br
