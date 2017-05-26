class: Workflow
cwlVersion: v1.0
dct:creator: {'@id': 'http://orcid.org/0000-0002-7681-6415', 'foaf:mbox': genomehacker@synapse.org,
  'foaf:name': genomehacker}
doc: 'SMC-RNA challenge isoform quantification submission

  GEXPRESS workflow: tar transcriptome index, analyze with GEXPRESS'
hints: []
id: main
inputs:
- {id: TUMOR_FASTQ_1, type: File}
- {id: TUMOR_FASTQ_2, type: File}
- {id: index, type: File}
name: main
outputs:
- {id: OUTPUT, outputSource: gexpress/output, type: File}
steps:
- id: gexpress
  in:
  - {id: dbdir, source: tar/output}
  - {id: fastq1, source: TUMOR_FASTQ_1}
  - {id: fastq2, source: TUMOR_FASTQ_2}
  - {default: GRCh37.75.transcripts, id: gmapdb}
  - {default: true, id: gunzip}
  - {default: 4, id: nthreads}
  - {default: 100, id: readlength}
  out: [output]
  run: gexpress.cwl
- id: tar
  in:
  - {id: input, source: index}
  out: [output]
  run: tarz.cwl
