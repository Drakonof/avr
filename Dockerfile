FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
	avr-libc \
	avrdude \
	gcc-avr \
	make \
	git \
	vim \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /avr

CMD ["/bin/bash"]