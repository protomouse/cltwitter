CC = gcc
CFLAGS = -Wall
INSTALLDIR = /usr/bin

all: tweet cltwitter-update-cache

tweet: definitions.h application_helpers.c network_helpers.c string_io_helpers.c tweet.c
	$(CC) $(CFLAGS) -o tweet -lcurl -lpcre definitions.h application_helpers.c string_io_helpers.c network_helpers.c tweet.c

cltwitter-update-cache: definitions.h application_helpers.c network_helpers.c xml_helpers.c cltwitter-update-cache.c
	$(CC) $(CFLAGS) -o cltwitter-update-cache -lcurl -lxml2 definitions.h application_helpers.c string_io_helpers.c network_helpers.c xml_helpers.c cltwitter-update-cache.c
  
clean: 
	rm -f tweet cltwitter-update-cache

install:
	cp tweet cltwitter-update-cache $(INSTALLDIR);
	mkdir -p /etc/cltwitter;
	cp completion/completion.bash /etc/cltwitter;
	@echo
	@echo "=========================================================="
	@echo "Installation done! Please add the following to your"
	@echo ".bashrc or .bash_profile:"
	@echo
	@echo "  source /etc/cltwitter/completion.bash"
	@echo
	@echo "to enable TAB-completion for Twitter replies."
	@echo "=========================================================="