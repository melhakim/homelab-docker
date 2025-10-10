docker run -tiv $PWD:/src \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -w /src --rm --entrypoint act_runner docker.io/gitea/act_runner:latest exec $@ # -nd
