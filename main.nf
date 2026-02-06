#!/usr/bin/env nextflow

process say_hello {
    echo true

    input:
    val(name)

    output:
    path "${name}.txt"

    script:
    """
    echo "Hello, ${name}!" > ${name}.txt
    """
}

process print_results {
    input:
    path(f)

    output:
    stdout

    script:
    """
    cat $f
    """
}

workflow {
    names = Channel.of("World", "Slurm", "NF-Orchestrator")
    results = say_hello(names)
    print_results(results)
}

