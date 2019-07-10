# purescript-http-helloworld

A toy implementation of a PureScript wrapper around [ExpressJS][expressjs]. Heavily inspired by the excellent [purescript-express][purescript-express].

## Why

I wanted to learn PureScript, and at the same time I needed to write a small utility as a web-app: I will do it in PureScript!

When I found [purescript-express], I found the example of what I needed, and I was about to copy-paste stuff into my code like a monkey.
But.. hey! Why being a monkey? I decided to take a deeper look. But, for a PureScript beginner, even a small and clean library like this
can be to complicated to digest.

Therefore I started writing my minimal implementation of the wrapper around [ExpressJS][expressjs] by looking at [purescript-express], 
copying what I needed, and changing things here and there to make sure I understood how it worked.

When I was finished, it occurred to me that this could be a starting point for others willing to understand the
PureScript FFI, and how to wrap effectful code in functional style, with the minimum possible noise.

## Install

Assuming that you have a [PureScript][purescript] development environment installed (essentially [pulp][pulp]), run:

```
npm install
```

and

```
bower install
```

Then build and run with the following command:

```
pulp run
```

You should see an output similar to:

```
* Building project in /Users/gigio/src/purescript-http-helloworld
* Build successful.
Example app listening at http://:::8787
```

[purescript]: https://github.com/purescript/documentation/blob/master/guides/Getting-Started.md
[pulp]: https://github.com/purescript-contrib/pulp
[purescript-express]: https://github.com/nkly/purescript-express
[expressjs]: https://expressjs.com/




