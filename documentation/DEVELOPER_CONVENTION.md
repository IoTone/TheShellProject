# DEVELOPER CONVENTIONS

In Shell Project, we're experimenting new ways to approach older and new problems concerning blockchain's.


### General coding styling

We will try to be concise and follow the "D way to throw the spear", always looking for code quality, ease of maintainability, flex and lean documentation.

#### High level comments

All modules should have a comment describing it's main function and desired responses/outputs, as well additional thoughts on what to do in next.

For high-level comments, the following "level style" is recommended :

```

/**
function anyArgs() {
    // functional code
}

**/

```

#### Low level comments

This complies all internal code comment, in which specific implementation took place, and some explanation of what's going on under the hood needs to be placed. 

For low-level comments, the following "level style" is recommended :

```

/*
function anyArgs() {
    // functional code
}
*/

```


### Branching convention

Branches naming convention follows the phase in which we're floating into.

As we keep the prototype phase yet, branch starts with proto + phase number + release stage.

So, for example, let's say we're in the first stage of development, the branch for this would be :

```
proto1-dev

```

The same way, staging and stable releases will be placed after the phase name and number.

### Workflow convention

Our general workflow for development are still in constant changing, as we identify new forms to code and follow design patterns concerning D.

### Identation

For now, we follow very basic coding style, so, regarding identation, is preferable from 2 to 3 levels of identation to keep the code lean and dry.
