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

** proto1-dev **

```

### Workflow convention

TODO

### General notes

TODO
