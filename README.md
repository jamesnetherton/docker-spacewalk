#docker-spacewalk

##Overview

An experiment to get [Spacewalk](http://spacewalk.redhat.com/) 2.2 running under Docker, as I wanted a quick means of running up the app to test stuff out. At the moment the application and the Postgres database all run within the same container. It'd be quite simple to split them out across separate containers and connect them together using --link and --volumes-from. 

##Building the image

Clone this repository, change into the source directory and run:

```
docker build -t jamesnetherton/spacewalk:2.2 .
```

##Running Spacewalk

To run Spacewalk do:

```
docker run --name spacewalk jamesnetherton/spacewalk:2.2
```

Then open a browser and hit the container IP address. You can determine the IP address by:
```
docker inspect --format {{.NetworkSettings.IPAddress}} spacewalk
```

It takes a little while to initialise everything, so don't panic if initially you get 'Service Temporarily Unavailable' messages. Be patient, refresh the page every 10 seconds or so and eventually you'll see the admin user creation page. 

##Mit License

The MIT License (MIT)

Copyright (c) 2014 James Netherton

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE

