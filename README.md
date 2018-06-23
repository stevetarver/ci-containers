This repo generates docker images for building software in various languages with various build systems; it provides CI containers for your CI system.

## Why

Build servers can be a single point of failure. They are provisioned, tools are installed, configured, evolved over time and rarely documented. Jenkins is the best, or worst, example because of myriad plugins, fragile dependencies, and exceptionally limited rollback. If you have ever upgraded Jenkins, had builds start failing, and spent long hours over your weekend trying to recover because all development has stopped - you get what I'm saying.

As a remedy, I use ephemeral Jenkins, deployed as a container, with an opinionated build pipeline that performs nearly all actions inside CI containers. This allows simple testing of new Jenkins versions, and rolling those into production. CI containers are a key element of that strategy.

When using CI containers:

* each project can choose a language and build system that suits them.
* no project build is broken because a global language or build system is updated.
* language and build system version and configuration is specified in the CI containter - documented.

## Building

Each directory:

* indicates the language and build system by directory name. 
* includes artifacts added to an image.
* contains numbered bash scripts that implement the build cycle.

In general, you will:

```
$ ./build.sh
$ ./run.sh
# perform any testing...
$ ./archive.sh
$ ./teardown.sh
```

## Versioning

For provenance clarity, the derived docker images use the build tag of the base image with a suffix indicating our revision of our derived image. The goal is to never put two images out with the same tag and different contents. This is a weak point in the whole docker process that we try to avoid through process.

Each directory has a `config.sh`; the top of which contains all things you may want to edit. The second item is `OUR_REVISION`. 

* On every successive build, increment that number
* On base image version update, reset that number to zero

## Optimizing builds

If your build system is instantiating a new container for each build, how do you avoid downloading shared artifacts, packages, and modules during each build?

You build system can mount volumes on the host where these java, groovy, python shared items live - the `.m2`, `.gradle`, `site-packages` directories. There are several choices that balance maximal caching and ephemeral nature of the build system - all specified on your docker run command.
