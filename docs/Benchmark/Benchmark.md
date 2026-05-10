
# Benchmark

[[https://thepharo.dev/2023/09/07/writing-benchmarks-with-smark/]]

Writing benchmarks with SMark
Posted byHernán MoralesSeptember 7, 2023Posted inprofilingTags:benchmarks, optimizations
Introduction
SMark is a benchmarking framework for Pharo written originally by Stefan Marr. It serves as an essential tool for Pharo developers, enabling them to benchmark their code, identify performance bottlenecks, and make informed decisions to enhance their software’s efficiency.

It is composed of four main components: A Suite (which represents the benchmarks), a Runner (responsible to execute benchmarks), a Reporter (which knows how and what data to report) and a Timer.

SMark behaves similar to the testing framework SUnit with setUp and tearDown methods. And the runner can do what it wants/needs to reach warmup. For instance, the SMarkCogRunner will make sure that all code is compiled before starting to measure. Both warmup and setup/teardown methods can be specified per-benchmark.

Installation
You can install SMark in Pharo evaluating the following expression:

1
2
3
4
Metacello new
    baseline: 'SMark';
    repository: 'github://guillep/SMark';
    load.
How to implement a benchmark
Create a subclass of SMarkSuite. Inheritance from SMarkSuite is not a requirement but a convenient way to use the multiple hooks which the Suite offers.

1
2
3
4
SMarkSuite subclass: #MyBenchmarkSuite
    instanceVariableNames: ''
    classVariableNames: ''
    package: 'MyProject'
Add a method named #bench<MyBenchmark>, like: #benchFactorial. This will be your real benchmark method. For example, a simple case repeating the benchmarking task would look like:

1
2
3
benchMyBenchmark
 
    self problemSize timesRepeat: [ … ]
and a benchmark which uses an index variable on each iteration, and the problem size:

1
2
3
4
5
6
7
benchMyBenchmark
 
    | i |
    i := self problemSize.
    [ i > 0 ] whileTrue: [
        " Some task using i "
        i := i - 1 ].
Hooks
There are multiple optional hooks to implement in your benchmark suite:

Define number of iterations in class side:

1
2
MyBenchmarkSuite class>>defaultNumberOfIterations
    ^ 50
Define number of processes in class side:

1
2
MyBenchmarkSuite class>>defaultNumberOfProcesses
    ^ 8
Define problem size in class side

1
2
MyBenchmarkSuite class>>defaultProblemSize
    ^ 30
You can also override MyBenchmarkSuite>>setUp to set up the necessary environment for a benchmark and, if a specific benchmarks in your suite needs additional configuration, then create a method named MyBenchmarkSuite>>setUpBench<yourBenchmarkName> to set up the custom configuration (for example if you are benchmarking benchRegexDNA then you can create a setUpBenchRegexDNA if necessary).

Overriding MyBenchmarkSuite>>processResult:withTimer: will allow you to access the timer after a benchmark execution. And do not forget to override MyBenchmarkSuite>>tearDown to clean up the environment after a benchmark.

How to run benchmarks
To run a benchmark suite directly from Pharo, let’s say for example performing 100 Iterations:

1
MyBenchmarkSuite run: 100
However, that would only run the benchmark with the default settings in SMark. You can run more complex configurations of your suite using the Harness support, which is a conveninence executor around the runner strategies and the reporter, for example:

1
2
3
4
5
6
7
SMarkHarness run: { 
    'SMarkHarness'. 
    'SMarkLoops.benchIntLoop' . 
    1 . "The number of iterations"
    1 . "The number of processes"
    5   "The problem size"
    }.
Running built-in benchmarks
For instance to run the built-in benchmarks related to bioinformatics, often used to compare different programming languages, libraries, and algorithms for handling large-scale data processing tasks, these Harness can be evaluated:

1
2
3
SMarkHarness run: { 'SMarkHarness'. 'BenchmarkGameSuite.benchKNucleotide'. 20 . 1 . 2 }.
SMarkHarness run: { 'SMarkHarness'. 'BenchmarkGameSuite.benchFasta'. 25 . 1 . 10 }.
SMarkHarness run: { 'SMarkHarness'. 'BenchmarkGameSuite.benchRegexDNA'. 3 . 1 . 10 }.
The K-Nucleotide benchmark involves counting the occurrences of all k-length substrings (k-mers) in a given DNA sequence. The benchmark will be run 20 times, using 1 process

The FASTA benchmark is composed of 3 sub-benchmarks:

The first sub-benchmark writes DNA sequences to a special stream. The nucleotide sequences corresponds to a specific DNA repeated sequence called “ALU“. The benchmark also setup a problem size of 10 to instantiate a custom “repeat” stream, a stream for which its “end” is configured to a limit number and it automatically restarts its position when this end is reached as result of receiving #next. This stream is set to 20 repetitions as limit (2 * problemSize). Finally, the fasta is configured with a line length to write 60 nucleotide positions (columns) before a new line.
The second sub-benchmark is configured to 30 repetitions (3 * problemSize) as limit and performs additional calculations instead of just writing the sequence. It iterates another custom repeat stream (a random stream, which uses a naïve linear congruential generator to calculate a random number for each #next message it receives along with percentages – the cumulative probabilities to select each nucleotide) adding and storing the percentage of each ambiguity code (codes used in molecular biology to represent positions in a DNA or protein sequence where the exact nucleotide or amino acid is not known with certainty) in a sequence to provide information about the composition of the sequence in terms of ambiguous and non-ambiguous positions.
The third and last sub-benchmark is configured to 50 repetitions as limit but includes preconfigured frequencies instead of performing the ambiguity codes additions for each code.
Finally, the benchRegexDNA measures the performance of regular expression-based DNA sequence analysis on a given DNA sequence, including pattern matching and substitution operations for sequences with “degenerate” codes.

Running from command-line
To run the benchmark harness from CLI:

1
./pharo -headless Pharo.image --no-default-preferences eval "SMarkHarness run: { 'SMarkHarness'. 'BenchmarkGameSuite.benchFasta'. 1 . 1 . 25000000 }."
And the default output (the console) should look like:

1
2
3
4
5
6
7
Runner Configuration:
  iterations: 1
  processes: 1
  problem size: 25000000
Report for: BenchmarkGameSuite
Benchmark Fasta
Fasta total: iterations=1 runtime: 14508ms
Some benchmarks are already pre-configured with convenience accessors and default values for the benchmarks game, so it is easier to run them, however, by default, they will not use the SMark reporting support and thus runtime results are not written to the output. For example the FASTA benchmark which expects a 10 kb output file can be run as:

1
./pharo -headless Pharo.image --no-default-preferences eval "BGFasta fasta"
which output the FASTA format (truncated here):

1
2
3
4
5
6
7
'>ONE Homo sapiens alu
GGCCGGGCGCGGTGGCTCACGCCTGTAATCCCAGCACTTTGGGAGGCCGAGGCGGGCGGA
TCACCTGAGGTCAGGAGTTCGAGACCAGCCTGGCCAACATGGTGAAACCCCGTCTCTACT
AAAAATACAAAAATTAGCCGGGCGTGGTGGCGCGCGCCTGTAATCCCAGCTACTCGGGAG
GCTGAGGCAGGAGAATCGCTTGAACCCGGGAGGCGGAGGTTGCAGTGAGCCGAGATCGCG
CCACTGCACTCCAGCCTGGGCGACAGAGCGAGACTCCGTCTCAAAAAGGCCGGGCGCGGT
... 
Parametrized benchmarks
If you have complex combinations of benchmarks, for example combining multiple data source with multiple readers and reading strategies, you can write your own benchmarkParameters method in your suite class, to access the built-in support for parametrized test matrix.

To see example code where this is used, check this implementation of JSON benchmarking using NeoJSON and SMark. You can evaluate the benchmark from Pharo with the following expression:

1
JSONSMarkSuite new benchReadJSON.
In this case, on a new execution, the benchmarks are executed by expanding the matrix of parameters. One important note is that results are collected after a warm up. This means that there will be some executions in what is called the “steady state”, a state where the JIT compiler already produced the code and represents a representative execution.

You can check a benchmark has started looking at the terminal, where output should be something reflecting your parameters:

1
2
3
4
Runner Configuration:
  iterations: 1
  processes: 1
  problem size: 1
Customize reporting
If you want to send the benchmark output to another destination instead of the console, you can subclass ReBenchReporter with your own reporter class:

1
2
3
4
ReBenchReporter subclass: #MyBenchmarkReporter
    instanceVariableNames: ''
    classVariableNames: ''
    package: 'MyProject'
and override the method #reportResult:for:of: where you have access to an output stream and an Array of results:

1
2
3
4
5
6
7
8
9
10
11
12
13
14
reportResult: aResultsArray for: aCriterion of: benchmark
    "Report duration"
    aResultsArray size < 2 ifTrue: [
        aResultsArray average printOn: stream.
        stream << 'ms'; << $, ].
    "Report iterations count"  
    aResultsArray size printOn: stream.
    stream << $,.
    "Report image name"
    Smalltalk image version printOn: stream.
    stream << $,.
    "Report VM name"
    Smalltalk vm interpreterClass substrings first printOn: stream.
    stream flush.
If this is your case, the harness also should be linked to your reporter:

1
2
3
4
ReBenchHarness subclass: #MyBenchmarkHarness
    instanceVariableNames: ''
    classVariableNames: ''
    package: 'MyProject'
and the defaultReporter method in class side should answer your reporter class. Also the method defaultOutputDestination should be overriden to configure the output:

1
2
3
4
defaultOutputDestination
    "Answer a <Stream> used to output receiver's contents"
 
    ^ self defaultOutputFilename asFileReference writeStream
Conclusion
In conclusion, this articule has provided an overview of the SMark benchmark for Pharo. Continued exploration and utilization of SMark will lead to the creation of high-performance software in Pharo, ultimately benefiting the broader community. So, go forth, experiment, and strive for excellence in your Pharo projects with the insights gained from this tutorial.

Happy benchmarking!

---------------------------------------------------------------------------------------------------

To measure the duration of a method in Pharo Smalltalk, you can manually record time points before and after execution or use the built-in benchmarking frameworks. 

Manual Measurement
You can calculate the difference between two TimeStamp or DateAndTime objects to get a Duration object representing the elapsed time. 

| start duration |
start := TimeStamp now.

" Execute the method you want to time "
YourClass yourMethod: 'argument'.

duration := TimeStamp now - start.
Transcript show: 'Method took: '; show: duration printString; cr.

Using Benchmarking Tools
For more accurate or repeated measurements, Pharo includes benchmarking harnesses like SMark or ReBench.  These tools provide structured ways to run methods multiple times and report statistics like average duration and iteration counts, avoiding noise from system interruptions. 

SMark/ReBench: These are designed for performance testing and can be configured to output results to the console or custom reporters. 
System Reporter: While not a profiler, System -> System Reporter provides overall system information useful for context when debugging performance issues.
Profiling
If you need detailed insights into which methods are consuming the most time, use the System Profiler (accessible via Tools -> Profiler).  This tool instruments the code and provides a breakdown of execution time per method, which is more comprehensive than simple start/stop timing. 

