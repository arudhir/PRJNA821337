# A quick RNAseq on public data
PRJNA821337: https://www.ncbi.nlm.nih.gov/bioproject/PRJNA821337

To be honest, I wanted to do this experiment at Ginkgo anyways.

Anexic Staphylococcus {epidermidis, aureus} vs. co-cultured with Malessezia

On my personal computer, so trying to keep it light. Skipping rRNA filtering.

M1 Macs seem to have trouble with libboost and I couldn't quite get it to work. To avoid spending the next week wrestling with C libraries, I executed the Salmon steps inside a Docker container.

Update: This data looks highly suspicious. Very low mapping % for a lot of samples.

