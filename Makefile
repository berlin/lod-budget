senfin_org_url = https://raw.githubusercontent.com/berlin/lod-organigram/main/data/static/SenFin.ttl

generate:
	python bin/generate.py

generate+serve_locally:
	python bin/generate.py --site_url http://localhost:8000 --serve

data/temp/void.nt: void.ttl data/temp
	rdfpipe -i turtle -o ntriples $< > $@

data/temp/haushalt-be.nt: data/haushalt-be.ttl data/temp
	rdfpipe -i turtle -o ntriples $< > $@

data/temp/bezirke-be.nt: data/bezirke-be.ttl data/temp
	rdfpipe -i turtle -o ntriples $< > $@

data/temp/senfin_extra.nt: data/senfin_extra.ttl
	rdfpipe -i turtle -o ntriples $< > $@

# for testing purposes, only generate a small subset of the data:
data/temp/haushalt-be.part.nt: data/temp/haushalt-be.nt
	head -n 5000 $< > $@

data/temp/senfin.ttl: data/temp
	curl -o $@ "$(senfin_org_url)"

data/temp/senfin.nt: data/temp/senfin.ttl
	rdfpipe -i turtle -o ntriples $< > $@

data/temp/all.part.nt: data/temp/void.nt data/temp/senfin.nt data/temp/haushalt-be.part.nt
	rdfpipe -i ntriples -o ntriples $^ > $@

data/temp/all.nt: data/temp/void.nt data/temp/senfin.nt data/temp/bezirke-be.nt data/temp/haushalt-be.nt data/temp/senfin_extra.nt
	rdfpipe -i ntriples -o ntriples $^ > $@

_site:
	mkdir _site

data/temp:
	mkdir data/temp

clean:
	rm -rf _site
	rm -rf data/temp