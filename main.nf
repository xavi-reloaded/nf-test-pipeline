#!/usr/bin/env nextflow

Channel.from("World", "Slurm", "NF-Orchestrator").set { names }

process say_hello {
    echo true

    input:
    val name from names

    output:
    file "${name}.txt" into results

    script:
    """
    echo "Hello, ${name}!" > ${name}.txt
    """
}

process print_results {
    input:
    file f from results

    output:
    stdout

    script:
    """
    cat $f
    """
}

