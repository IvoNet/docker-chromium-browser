# Browser in browser

This project gives you a browser in a browser.

Yes its true :-)

## Why

Well sometimes you just want some privacy as you do not trust the network you are on.
An option is to use an isolated browser. How to do this... read on

## How

Docker and Nas to the rescue (and a few more things).

See [this](https://www.ivonet.nl) blog post.


## examples

```bash
docker run -d \ 
           --rm \
           --privileged \
           --name chrome \
           -p 8080:8080 \
           ivonet/chromium-browser
```

docker run -d --rm --privileged --name chrome  -p 8080:8080  ivonet/chromium-browser
