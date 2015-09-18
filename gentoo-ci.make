# vim:ft=make
jobs = 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 global
jobs_no = 16
repo = $(REPOS_DIR)/gentoo
checker = $(TRAVIS_REPO_CHECKS_GIT)/run-pkgcheck.bash
ts = $(SYNC_DIR)/gentoo/.git/timestamp

HOME = $(GENTOO_CI_GIT)

all: $(patsubst %,%.txt,$(jobs))

%.txt: $(ts)
	{ cd $(repo) && bash $(checker) $(patsubst %.txt,%,$@) $(jobs_no); } > $@ 2>&1

clean:
	rm -f *.txt

.PHONY: all