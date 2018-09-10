# Copyright (C) 2012 Mark Blakeney. This program is distributed under
# the terms of the GNU General Public License.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or any
# later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License at <http://www.gnu.org/licenses/> for more
# details.

APP=raise-or-run

DOC = README.md

DOCOUT = $(DOC:.md=.html)

all:
	@echo "Type sudo make install|uninstall"

install:
	@./$(APP)-setup -d "$(DESTDIR)" install

uninstall:
	@./$(APP)-setup -d "$(DESTDIR)" uninstall

doc:	$(DOCOUT)

$(DOCOUT): $(DOC)
	markdown $< >$@

check:
	shellcheck $(APP) $(APP)-setup

clean:
	rm -rf $(DOCOUT)
