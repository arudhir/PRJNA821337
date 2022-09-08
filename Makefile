.PHONY: help image bash
help: 
	echo "build image or get a bash shell"
image:
	docker build --platform linux/x86_64 -t altos .
bash: image
	docker run -v `pwd`/outputs:/app/outputs --platform linux/x86_64 --rm -it altos bash
run: image
	docker run -v `pwd`/outputs:/app/outputs --platform linux/x86_64 --rm -it altos snakemake all -c 1
