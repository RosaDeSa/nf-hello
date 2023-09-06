//nextflow.enable.dsl=2
texts = Channel.fromPath("AWS", "Nextflow")

process hello {
    container "debian:10.2"
    cpus 1
    memory '512 MB'

    publishDir "results" , mode: 'copy'

    input:
    val text from texts

    output:
    file 'hello_*.txt'

    script:
    """
    echo "Hello $text" > hello_${text}.txt
    """
}

workflow{
    hello()
}

/*profiles{
    lifesciences{
        process.executor = "google-lifesciences"
        google.project = "gcacchiarelli"
        google.zone = "europe-west1-b"
    }
}*/