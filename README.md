# Overview

The Shell Project: The Shell Project (working name) aims to build a viable general purpose blockchain, with attributes of security, ease of deployment, clear specification, ease of use for DAPPs, and multiple implementation interop.  Since the focus is on generalized use cases, not specifically cryptocurrency, it becomes possible for others to adapt this to their own use cases.  The goal is to keep this project pure OSS, although it is associated with a business entity.  We don't care who uses it, forks it, distributes it.  And we don't intend to file patents on anything that has the intent of requiring commercial licensing or targetted patent trolling.  The first implemetnation would be in Dlang.  We will be working with another developer to ensure at least one other blockchain implementation is built in Java.

## References

- Shells were used as an original currency and value store for early civilizations around the world, primarily in coastal regions.  In particular, Indigenous people of North America used shells along the pacific coast. https://en.wikipedia.org/wiki/Shell_money

## Why create The Shell Project

Why not.  Coding is an art as much as it is a passion, and embodies a multidisciplinary set of skills.  Cryptocurrency combines many disciplines of computer science, mathematics, and economics.  Blockchain is a realization of an approach to public key infrastructure and distributed work.  We believe the industry needs something not backed by the IBMs of the world, but backed by small companies that seek to support one another in growing the net blockchain economy, freely.  We want to build this first in Dlang because we like working in Dlang as opposed to simply forking someone else's C++ code.   We respect the hard work of others, and will provide attribution where we borrow concepts, site others work, and generally stand on the backs of giants.

### Why not fork Bitcoin?

Bitcoin has addressed the mainstream view for cryptocurrencies and large use of blockchain technology, demonstrating great potential for market change such as new ways to generate and manage digital assets. However, problems involving limitations in scalability and performance with the PoW (Proof-of-Work) such as security had lead to new implementations of Bitcoin and newer approaches. In the Shell Project we aim to leverage the best of what Bitcoin has taught the world about the cryptocurrency concept and practice.

### Why not fork Bytecoin?

It appears the forces behind Bytecoin believe in OSS as a marketing tool, but leverage the efforts as a tool to generate a patent portfolio.  In the great words of Bob Metcalfe, inventor of Ethernet, there wouldb be no Ethernet if PARC had tried to create a proprietary technology protected by patents.  They did patent, however, they licensed the technology for a dime, literally a token sum, creating an ecosystem of competing producers of gear around the Ethernet standard, staving off proprietary competitors, and making it possible for the entire ecosystem of networking standards to flourish.  We believe patents are "bad for ball", and won't yield anything good for competing cryptocurrency stacks unless Bytecoin agrees to create a patent pool and donate the patents to a foundation under the umbrella of a real standards body.

### Why not just use an ECR20 Token

TODO

## Use Cases

Tons of great use cases here: https://medium.com/swlh/blockchain-benefits-use-cases-d259c823e968


## Design

From Pedro:
1. Simple block generation and verification;
2. Node addition and recognizing;
3. Simple consensus of which operations was really performed into the blocks:
4. Shared state of hashed blocks;
5. Node health checking and consensus exposition;
6. Consensus achievement and possible "race conditions" that could be envolved
7. Design of simple business logics that could be run into the transaction blocks

## TODO

- Initial commits
- Project plan
- A white paper
- Perform experimental (but very simple) transactions to validate the prototype
- Find some additional contributors
- Define model and micro-transaction architecture for the blockchain

## General Notes

The D language (dlang.org) plays such a special role in software engineering space, providing amazing features for the purpose of saving lots of hours of work and empowering developers and engineers with awesomeness, just for the sake of simplicity and sanity. Some Dlang features aprecciated in this project should be noted :

### Design by Contract

Through contracts, an application can have so many ways to achieves its purpose, having such an organized and profiled way to do so, relying on reusable steps

### Template Programming

Notes...

### Metaprogramming

Notes...

### Fast compiling

Notes...

### Good readability

Notes...

### Code eficiency

Notes...

### Multiple platforms at once

Notes...

This undoubtly extends the potential of a general purpose blockchain to not only multiple platforms but others devices types, providing a fertile field to explore Internet of Things (IoT) scenarios into the blockchain ecosystem, and possibly find other use cases in other industries and academic research.

## Future benchmarks with other platforms

TODO

## Attributions

- Bitcoin: wow, not much to say more than thank you.  Bitcoin fuels our ideas, funds our dreams, and inspires our desire to build.
- NEM: We are borrowing a lot of great ideas from the NEM white paper.  We wish the entire NEM stack was open source.
- Ethereum: Bowing to the future king, Ethereum is changing how the finance industry thinks about their own fragile existence.

## Contributions

@pedroalvesbatista

For what we know, that's the first project from ground up made 100% in Brazil '-'