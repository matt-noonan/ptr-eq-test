
8.0.2:
	stack clean; \
	stack build; \
	stack exec ptr-eq-test

8.2.1:
	stack clean; \
	stack build --resolver nightly-2017-10-18;\
	stack exec  --resolver nightly-2017-10-18 ptr-eq-test

both:
	stack clean; \
	stack build; \
	stack clean --resolver nightly-2017-10-18; \
	stack build --resolver nightly-2017-10-18; \
	echo ;\
	echo 8.0.2:;\
	stack exec ptr-eq-test ;\
	echo ;\
	echo 8.2.1:;\
	stack exec --resolver nightly-2017-10-18 ptr-eq-test;\
	echo
