<!-- Auto generated file, please refer to README.yml -->
# Docker marcelocorreia/nodered

---
[![shield](https://img.shields.io/github/release/marcelocorreia/docker-nodered.svg?flat-square)](https://img.shields.io/github/release/marcelocorreia/docker-nodered.svg?flat-square)
[![shield](https://img.shields.io/docker/pulls/marcelocorreia/nodered.svg)](https://img.shields.io/docker/pulls/marcelocorreia/nodered.svg)
[![shield](https://img.shields.io/github/languages/top/marcelocorreia/docker-nodered.svg)](https://img.shields.io/github/languages/top/marcelocorreia/docker-nodered.svg)
---
### TLDR;
- [Overview](#overview)
- [Description](#description)
- [Dockerfile](#dockefile)
- [Usage](#usage)
- [License](#license)
### Overview
Docker Node Red image





### Usage
### Alias
```bash
$ alias credstash="docker run --rm  -v $(HOME)/.aws:/root/.aws marcelocorreia/credstash"
```
```bash
$ docker run --rm -it  -v /Users/marcelo/.aws:/root/.aws marcelocorreia/credstash \
    -r ap-southeast-2 -p my-profile list
```
## Setting timezone
```bash
$ docker run --rm -it  -v /Users/marcelo/.aws:/root/.aws  \
    -e TZ=Australia/Sydney marcelocorreia/credstash -r ap-southeast-2 -p my-profile list
```
**Targets**
```bash
$ make release
$ make build
$ make push
$ make all-versions
$ make current-version
$ make next-version
```




## Dockerfile 
```Dockerfile
FROM marcelocorreia/base-node
MAINTAINER marcelo correia <marcelo@correia.io>

#RUN apt-get update -y
#RUN apt-get install curl git -y
#RUN apt-get install build-essential libssl-dev -y
#RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
#RUN apt-get install -y nodejs mysql-client net-tools
#

RUN npm install -g --unsafe-perm node-red
RUN npm install -g node-red-node-serialport
RUN npm install -g node-red-contrib-cron
RUN npm install -g node-red-contrib-moment2
RUN npm install -g node-red-node-mongodb
RUN npm install -g node-red-contrib-bigtimer
RUN npm install -g node-red-contrib-google
RUN npm install -g node-red-contrib-mock
RUN npm install -g node-red-contrib-os
RUN npm install -g node-red-contrib-date
RUN npm install -g node-red-node-mysql
RUN npm install -g node-red-contrib-screenshot
RUN npm install -g node-red-contrib-youtube
RUN npm install -g node-red-contrib-chromecast
RUN npm install -g node-red-contrib-redis
RUN npm install -g node-red-contrib-fluentd-parser
RUN npm install -g node-red-contrib-elasticsearch3
RUN npm install -g node-red-node-youtube
RUN npm install -g node-red-contrib-aws
RUN npm install -g node-red-dashboard
RUN npm install -g node-red-contrib-soapserver
RUN npm install -g node-red-contrib-slack

RUN mkdir /app
WORKDIR /app

EXPOSE 1880

ENTRYPOINT ["node-red"]

```

<!-- Apache License -->
### License 

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) 

Copyright [2015] 

    Licensed to the Apache Software Foundation (ASF) under one
    or more contributor license agreements.  See the NOTICE file
    distributed with this work for additional information
    regarding copyright ownership.  The ASF licenses this file
    to you under the Apache License, Version 2.0 (the
    "License"); you may not use this file except in compliance
    with the License.  You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.
    
<!-- -->






[github]: https://github.com/marcelocorreia

[linkedin]: https://www.linkedin.com/in/marcelocorreia/



[slack]: https://correia-group.slack.com/



