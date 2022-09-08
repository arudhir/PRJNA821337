from pathlib import Path

configfile: 'config.yml'

rule download_reads:
	output:
		r1 = temp('outputs/reads/{sample}_1.fastq'),
		r2 = temp('outputs/reads/{sample}_2.fastq'),
		r1gz = 'outputs/reads/{sample}_1.fastq.gz',
		r2gz = 'outputs/reads/{sample}_2.fastq.gz'
	params:'outputs/reads'
	shell:
		"""
		fasterq-dump {wildcards.sample} -O {params} -v
		pigz {output.r1}
		pigz output.r2
		"""

rule quant:
	input:
		r1 = 'outputs/reads/{sample}_1.fastq.gz',
		r2 = 'outputs/reads/{sample}_2.fastq.gz'
	output:
		outdir = directory('outputs/quants/{sample}'),
		quants = 'outputs/quants/{sample}/quant.sf',
		stats = 'outputs/quants/{sample}/aux_info/meta_info.json'
	params:
		'outputs/index'
	threads: 1
	shell:
		"""
		salmon quant -l ISR -1 {input.r1} -2 {input.r2} -o {output.outdir} -i {params}
		"""

rule all:
	input:
		quants = expand(
			rules.quant.output.quants,
			sample=config['samples'],
			transcripts=config['transcripts']
		)