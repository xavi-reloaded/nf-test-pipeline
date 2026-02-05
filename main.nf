#!/usr/bin/env nextflow

/*
 * Hello World pipeline para probar NF-Orchestrator
 */

process say_hello {
    echo true

    input:
    val name from ["World", "Slurm", "NF-Orchestrator"]

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

workflow {
    say_hello()
    print_results()
}

