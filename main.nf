#!/usr/bin/env nextflow

nextflow.enable.dsl=2

process say_hello {
    debug true

    input:
    val name

    output:
    path "${name}.txt"

    script:
    """
    echo "Hello, ${name}!" > ${name}.txt
    """
}

process print_results {
    input:
    path f

    output:
    stdout

    script:
    """
    cat $f
    """
}

workflow {
    names = Channel.of('World', 'Slurm', 'NF-Orchestrator')
    results = say_hello(names)
    print_results(results)
}

