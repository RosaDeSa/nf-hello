//nextflow.enable.dsl=2
texts = Channel.from("AWS", "Nextflow")

process hello {
    machineType 'e2-standard-2'

    publishDir "results" , mode: 'copy'

    input:
    val(text)

    output:
    file 'hello_*.txt'

    script:
    """
    echo "Hello $text" > hello_${text}.txt
    """
}

workflow{
    hello(texts)
}

/*profiles{
    lifesciences{
        process.executor = "google-lifesciences"
        google.project = "gcacchiarelli"
        google.zone = "europe-west1-b"
    }
}*/