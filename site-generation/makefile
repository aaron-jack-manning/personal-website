CUSTOM_LIBRARY_LOCATION = lib
DSL_LOCATION = html-dsl
COMPILE = ocamlopt -O3 -nopervasives -I $(CUSTOM_LIBRARY_LOCATION) -I $(DSL_LOCATION) -c

site:
	make install
	make run

build:
	$(COMPILE) main.ml

	ocamlopt -I $(DSL_LOCATION) -I $(CUSTOM_LIBRARY_LOCATION) $(CUSTOM_LIBRARY_LOCATION)/library.cmxa $(DSL_LOCATION)/library.cmxa main.cmx -o program

mostlyclean:
	rm -f *.o *.a *.s *.cmi *.cmx *.cmxa *.cmo *.cma

clean:
	rm -f *.o *.a *.s *.cmi *.cmx *.cmxa *.cmo *.cma program

make install:
	make build
	make mostlyclean

run:
	./program