generate:
	python bin/generate.py

generate+serve_locally:
	python bin/generate.py --site_url http://localhost:8000 --serve

data/temp/void.nt: void.ttl data/temp
	rapper -i turtle $< > $@

data/temp/haushalt-be.nt: data/haushalt-be.ttl data/temp
	rapper -i turtle $< > $@

# for testing purposes, only generate a small subset of the data:
data/temp/haushalt-be.part.nt: data/temp/haushalt-be.nt
	head -n 50000 $< > $@

data/temp/all.part.nt: data/temp/void.nt data/temp/haushalt-be.part.nt
	rdfpipe -i ntriples -o ntriples $^ > $@

data/temp/all.nt: data/temp/void.nt data/temp/haushalt-be.nt
	rdfpipe -i ntriples -o ntriples $^ > $@

_site:
	mkdir _site

data/temp:
	mkdir data/temp

clean:
	rm -rf _site
	rm -rf data/temp