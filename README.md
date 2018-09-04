# Overview

The Shell Project: The Shell Project (working name) aims to build a viable general purpose blockchain, with attributes of security, ease of deployment, clear specification, ease of use for DAPPs, and multiple implementation interop.  Since the focus is on generalized use cases, not specifically cryptocurrency, it becomes possible for others to adapt this to their own use cases.  The goal is to keep this project pure OSS, although it is associated with a business entity.  We don't care who uses it, forks it, distributes it.  And we don't intend to file patents on anything that has the intent of requiring commercial licensing or targetted patent trolling.  The first implemetnation would be in [Dlang](https://dlang.org).  We will be working with another developer to ensure at least one other blockchain implementation is built in Java.

## Why create The Shell Project

Why not.  Coding is an art as much as it is a passion, and embodies a multidisciplinary set of skills.  Cryptocurrency combines many disciplines of computer science, mathematics, and economics.  Blockchain is a realization of an approach to public key infrastructure and distributed work.  We believe the industry needs something not backed by the IBMs of the world, but backed by small companies that seek to support one another in growing the net blockchain economy, freely.  We want to build this first in Dlang because we like working in Dlang as opposed to simply forking someone else's C++ code.   We respect the hard work of others, and will provide attribution where we borrow concepts, site others' work, and generally stand on the backs of giants.

## References

- Shells were used as an original currency and value store for early civilizations around the world, primarily in coastal regions.  In particular, indigenous people of North America used shells along the Pacific coast. https://en.wikipedia.org/wiki/Shell_money

### Why not fork Bitcoin?

Bitcoin has addressed the mainstream view for cryptocurrencies and large use of blockchain technology, demonstrating great potential for market change such as new ways to generate and manage digital assets. However, problems involving limitations in scalability and performance with the PoW (Proof-of-Work) such as security had lead to new implementations of Bitcoin and newer approaches. In the Shell Project we aim to leverage the best of what Bitcoin has taught the world about the cryptocurrency concept and practice.

### Why not fork Bytecoin?

It appears the forces behind Bytecoin believe in OSS as a marketing tool, but leverage the efforts as a tool to generate a patent portfolio.  In the great words of Bob Metcalfe, inventor of Ethernet, there would be no Ethernet if PARC had tried to create a proprietary technology protected by patents.  They did patent, however, they licensed the technology for a dime, literally a token sum, creating an ecosystem of competing producers of gear around the Ethernet standard, staving off proprietary competitors, and making it possible for the entire ecosystem of networking standards to flourish.  We believe patents are "bad for ball", and won't yield anything good for competing cryptocurrency stacks unless Bytecoin agrees to create a patent pool and donate the patents to a foundation under the umbrella of a real standards body.

### Why not just use an ECR20 Token

The idea of token contracts has blasted the world with new possibilities, opening an almost unthinkable set of new formats in which we can split trust, business models, as well "freedom formats", where to spot any kind of assets. Contract execution and tokens aren't brand new, but how Ethereum and ECR20 token interfaces with the outside world , undoubtely constitutes game changers. A good reason we do not just use an ECR20 token to accomplish 

## Use Cases

Tons of great use cases here: https://medium.com/swlh/blockchain-benefits-use-cases-d259c823e968


## Design

1. Simple block generation and verification;
2. Node addition and recognizing;
3. Simple consensus of which operations was really performed into the blocks;
4. Shared state of hashed blocks;
5. Node health checking and consensus exposition;
6. Consensus achievement and possible "race conditions" that could be involved;
7. Design of simple business logics that could be run into the transaction blocks


## First thing first: What makes D a good fit for this endeavor ?

[The D programming language](https://dlang.org) plays such a special role in software engineering space, providing amazing features for the purpose of saving lots of hours of work and empowering developers and engineers with awesomeness, just for the sake of simplicity and sanity. Some Dlang features apreciated in this project are noted below.

In the documentation directory, the Why D section explains why using D can be provide such a reliable and full-batery blockchain implementation concerning a lot of requirements.



## Attributions

- Bitcoin: Wow! Not much to say more than thank you.  Bitcoin fuels our ideas, funds our dreams, and inspires our desire to build.
- NEM: We are borrowing a lot of great ideas from the NEM white paper.  We wish the entire NEM stack was open source.
- Ethereum: Bowing to the future king, Ethereum is changing how the finance industry thinks about their own fragile existence.
- EOS: EOS Project and it's huge ecosystem of features and ambitious goals to achieve the fastest and reliable blockchain, as well being a great chance in how decentralized applications should be architected and runned, producing a novel start to future developments.

## Future benchmarks with other platforms

As blockachains applications represents new flavors when comes about the distributed and decentralized nature of systems, relying on benchmarkings to determine which one is the best for particular cases surely seems to be something compeling a no brainer task. Rather than that, comparing implementantions, algorithms and data structures, as well cryptographic proofs in transactions against diverse scenarios, with well pointed measures and parameters

The following table resumes a little of what is aimed in terms of benchmarking with other blockchain implementations, to, in more general means, collect progressive information allowing continuous improvements, while keeping the core dry and concise.

So far as we can notice, Hyperledger Project has in its umbrella a framework called [Calliper](https://github.com/hyperledger/caliper), which aims "to measure performance of multiple blockchain solutions", so, maybe this is the most known solution for running benchmark in blockchain solutions. 

Note : We do not intend to copy and past the Calliper way of doing benchmark, but, some ideas or features would 
deserve some cherrypicking, if the license allow us to borrow some of it.

| Criteria             | Parameter |
|----------------------|-----------|
| Performance          |           |
| Transaction          |           |
| Cryptographic Proof  |           |
| Networking           |           |


## Contributions

@pedroalvesbatista

For what we know, this is the first project from ground up made 100% in Brazil. '-'

## TODO

- Initial commits
- Project plan
- A white paper
- Perform experimental (but very simple) transactions to validate the prototype
- Find some additional contributors
- Define model and micro-transaction architecture for the blockchain
- Define final specs for experiments in simple cases
