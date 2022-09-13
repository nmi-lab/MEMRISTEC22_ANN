HEAD := src_slides/master_head.html.part
FOOT := src_slides/master_foot.html.part
DIR  := src_slides
SRCS := $(wildcard $(DIR)/*.html)


main.html: $(HEAD) $(SRCS) $(FOOT) 
	cat $(HEAD) $(SRCS) $(FOOT) > main.html

all: main.html

list: $(SRCS)
	for f in $^ ; do \
		 n=$$(echo $${f} | sed -e s/[^0-9]//g)   ;\
		 cat $(HEAD) $$f $(FOOT) > "./slides_"$$n.html;\
	done
