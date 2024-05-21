# Docker-In-Docker Examples

Imagine the following setup:

- (1) You have some code in Python,
- (2) At some point, that code wants to invoke an image and get an output

(1), of course, needs to run in an appropriate image. You might put together a
`docker-compose.yaml` file to spin it up.

(2), of course, needs to also run. But it only runs on-demand, so it can't go
in the `docker-compose` file. You want to invoke something like `docker run
...` to get that output. So of course you original image (1) requires `docker`
to be installed ...

How can you make this work?

Let's try a few ways:

- (0) Just try it
- (a) A Docker-In-Docker thing
- (b) A normal docker thing with socket sharing
- (c) Nix

Look in the relevant folders for details.
