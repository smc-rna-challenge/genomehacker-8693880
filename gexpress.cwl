arguments:
- {position: 1, prefix: -D, valueFrom: $(inputs.dbdir)}
baseCommand: [gexpress]
class: CommandLineTool
cwlVersion: v1.0
doc: 'GEXPRESS: Analysis'
hints:
- {class: DockerRequirement, dockerPull: 'quay.io/smc-rna-challenge/genomehacker-8693880-gsnap:1.0.0'}
inputs:
- {id: dbdir, type: Directory}
- id: fastq1
  inputBinding: {position: 98}
  type: File
- id: fastq2
  inputBinding: {position: 99}
  type: ['null', File]
- id: gmapdb
  inputBinding: {position: 2, prefix: -d}
  type: string
- id: gunzip
  inputBinding: {position: 97, prefix: -g}
  type: boolean
- id: nthreads
  inputBinding: {position: 4, prefix: -t}
  type: int
- id: readlength
  inputBinding: {position: 3, prefix: -L}
  type: int
outputs:
- id: output
  outputBinding: {glob: sample.expr}
  type: File
requirements:
- {class: InlineJavascriptRequirement}
