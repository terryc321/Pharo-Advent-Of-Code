
# Profile

```text
Class: AndreasSystemProfiler
                                                                                                    
AndreasSystemProfiler uses sub-msec VM supported PC sampling.

In Memory of Andreas Raab.  Author, Friend, Colleague. 	http://forum.world.st/In-Memory-of-Andreas-Raab-td4663424.html
Released by Ron, Julie and David

Example:
AndreasSystemProfiler spyOn: [ 10000 timesRepeat: [ 3.14159 printString ] ]

-=-=-=-=-=-=-=
Apparently, the time taken to run the provided block is as twice as long as run without the profiler.

-=-=-=-=-=-=-=
Both AndreasSystemProfiler and MessageTally are periodic sampling profilers.  The essential difference between AndreasSystemProfiler and MessageTally is in how the current method is sampled.

MessageTally is driven from a high-priority process in a loop waiting on a delay.  When the delay fires the lower-priority process being profiled is interrupted, its stack is walked to determine the methods along the call chain, and that data is recorded.  But since the sampling occurs when the high-priority process preempts the lower-priority process, a sample is only taken at a preemption point.  In particular, primitives are not profiled because they are not suspension points.  A process can only be suspended on method activation (a non-primitive method activation, or primitive failure) or on backward branch.  The cost of primitives is charged to a caller and is inferred by subtracting the cost of children of the caller from the caller itself (subtracting the number of samples in children of the caller form the number of samples in the caller itself).

Another problem is that using the clock that underlies Delay, which is typically the clock used by processes being profiled, causes sampling errors due to the sampling and sampled processes cohering.  Delays are limited in resolution (at best 1 millisecond) so if the profiled process waits on a delay it'll fire immediately after the profiling process (because the profiling process is at higher priority) and so the sampling process may only ever see the sampled process in a wait state.

If MessageTally is used to profile multiple processes then a third problem is that if a primitive causes a process switch then its cost will end up being charged to the process switched-to, not switched from.  This is again because sampling can only occur after a primitive has completed (successfully or not).

AndreasSystemProfiler is driven from a high-priority process in a loop waiting on a Semaphore known to the VM.  The profiling process uses a primitive to schedule a sample some number of ticks of the VM's high-performance clock in the future.  When the time is reached the VM samples the current method and the current process, before any process preemption takes place, and independently of the standard clock, and signals the semaphore.  The profiling process then collects the method,process pair via primitives.  So AndreasSystemProfiler provides much more accurate results.

That said there are still limitations with primitives and Cog.  Currently Cog only samples "interpreter" primitives.  Those primitives it implements in machine code (integer and float arithmetic, closure evaluation, at:, identityHash) are not sampled and won't show up; they will be charged to the calling method.  This is fixable, since Cog actually compiles the sampling direct into interpreter primitive invocation when profiling is in effect and not at other times, but sampling could be a significant cost in these simple and performance-critical primitives.
```


```text
AISLOP < on pharo how do i profile code >

Pharo Smalltalk does not have a single built-in profiler in the standard image; instead, it relies on Spy2, a powerful profiling framework available in the ecosystem. 

Spy2 is the primary tool for performance profiling and visual test coverage in Pharo. 
It is part of the Hapao project, which provides the underlying instrumentation and visualization capabilities. 
You can install Spy2 by loading the package from the Metacello repository or via the ConfigurationOfHapao baseline in your Playground.
To get started, open a Playground and load the Hapao configuration to access the Spy2 profiler, which allows you to record method execution times and visualize the call hierarchy.
```
Hapao

```smalltalk

```
``` text
Reporting - 28 tallies, 16 msec.

**Tree**
100.0 (16)  FullBlockClosure [BlockClosure]  newProcess
  100.0 (16)  MorphicUIManager  spawnNewProcess
    100.0 (16)  MorphicRenderLoop  doOneCycleWhile:
      100.0 (16)  MorphicRenderLoop  doOneCycle
        100.0 (16)  WorldMorph class  doOneCycle
          100.0 (16)  WorldState class  doDrawCycleWith:
            100.0 (16)  FullBlockClosure [BlockClosure]  ensure:
              100.0 (16)  WorldMorph class  doOneCycle
                100.0 (16)  WorldMorph  doOneCycle
                  100.0 (16)  WorldMorph  doOneCycleNow
                    100.0 (16)  WorldState  doOneCycleFor:
                      100.0 (16)  WorldMorph  runStepMethods
                        100.0 (16)  WorldState  runStepMethodsIn:
                          100.0 (16)  OSWindowMorphicEventHandler  dispatchMorphicEvent:
                            100.0 (16)  HandMorph  handleEvent:
                              100.0 (16)  HandMorph  sendKeyboardEvent:
                                100.0 (16)  HandMorph  sendEvent:focus:clear:
                                  100.0 (16)  HandMorph  sendFocusEvent:to:clear:
                                    100.0 (16)  WorldMorph  becomeActiveDuring:
                                      100.0 (16)  FullBlockClosure [BlockClosure]  on:do:
                                        100.0 (16)  HandMorph  sendFocusEvent:to:clear:
                                          100.0 (16)  RubEditingArea [Morph]  handleFocusEvent:
                                            100.0 (16)  RubEditingArea [Morph]  handleEvent:
                                              100.0 (16)  KeyboardEvent  sentTo:
                                                100.0 (16)  RubEditingArea [RubAbstractTextArea]  handleKeyDown:
                                                  100.0 (16)  RubEditingArea [Morph]  handleKeyDown:
                                                    100.0 (16)  KMShortcutHandler  handleKeystroke:inMorph:
                                                      100.0 (16)  RubEditingArea [Morph]  handleKeystrokeWithKeymappings:
                                                        100.0 (16)  RubEditingArea [Morph]  dispatchKeystrokeForEvent:
                                                          100.0 (16)  KMDispatcher  dispatchKeystroke:
                                                            100.0 (16)  KMDispatchChain  dispatch:
                                                              100.0 (16)  KMDispatchChain  do:
                                                                100.0 (16)  KMDispatchChain  dispatch:
                                                                  100.0 (16)  KMTarget  dispatch:
                                                                    100.0 (16)  KMDispatcher  dispatch:
[100.0 (16)  OrderedCollection  do:
[  100.0 (16)  KMDispatcher  dispatch:
[    100.0 (16)  KMCategoryBinding  verifyMatchWith:notifying:thenDoing:
[      100.0 (16)  KMCategory  onMatchWith:notify:andDo:
[        100.0 (16)  Set  do:
[          100.0 (16)  KMCategory  onMatchWith:notify:andDo:
[            100.0 (16)  KMKeymap  onMatchWith:notify:andDo:
[              100.0 (16)  KMKeymap  notifyCompleteMatchTo:buffer:
[                100.0 (16)  Array [SequenceableCollection]  do:
[                  100.0 (16)  KMKeymap  notifyCompleteMatchTo:buffer:
[                    100.0 (16)  KMCategoryBinding  completeMatch:buffer:
[                      100.0 (16)  FullBlockClosure [BlockClosure]  cull:cull:cull:
[                        100.0 (16)  FullBlockClosure [BlockClosure]  cull:cull:
[                          100.0 (16)  FullBlockClosure [BlockClosure]  cull:
[                            100.0 (16)  SpKMCategoryBuilder  visitCommand:
[                              100.0 (16)  SpToolCurrentApplicationCommand  execute
[                                100.0 (16)  SpToolCurrentApplication class [DynamicVariable class]  value:during:
[                                  100.0 (16)  SpToolCurrentApplication [DynamicVariable]  value:during:
[                                    100.0 (16)  FullBlockClosure [BlockClosure]  ensure:
[                                      100.0 (16)  SpToolCurrentApplication [DynamicVariable]  value:during:
[                                        100.0 (16)  SpToolCurrentApplicationCommand  execute
[                                          100.0 (16)  SpCommand [CmCommandDecorator]  execute
[                                            100.0 (16)  StEvaluateCommand  execute
[                                              100.0 (16)  StPlaygroundPagePresenter  doEvaluateAndGo
[                                                100.0 (16)  SpCodePresenter  evaluate:onCompileError:onError:
[                                                  100.0 (16)  FullBlockClosure [BlockClosure]  on:do:
[                                                    100.0 (16)  SpCodePresenter  evaluate:onCompileError:onError:
[                                                      100.0 (16)  OpalCompiler  evaluate
[                                                        100.0 (16)  OCReceiverDoItSemanticScope [OCDoItSemanticScope]  evaluateDoIt:
[                                                          100.0 (16)  UndefinedObject  DoIt
[                                                            100.0 (16)  AOC2015Day23  profilePart1
[                                                              100.0 (16)  AndreasSystemProfiler class  spyOn:
[                                                                100.0 (16)  FullBlockClosure [BlockClosure]  ensure:
[                                                                  100.0 (16)  AndreasSystemProfiler class  spyOn:
[                                                                    100.0 (16)  AndreasSystemProfiler  spyOn:
[[100.0 (16)  FullBlockClosure [BlockClosure]  ensure:
[[  100.0 (16)  AOC2015Day23  profilePart1
[[    100.0 (16)  AOC2015Day23  part1
[[      100.0 (16)  AOC2015Day23Parser class [Behavior]  new
[[        100.0 (16)  AOC2015Day23Parser  initialize
[[          100.0 (16)  AOC2015Day23Parser  interpretInput:
[[            92.0 (15)  OrderedCollection  collect:
[[              |92.0 (15)  AOC2015Day23Parser  interpretInput:
[[              |  78.30000000000001 (13)  AOC2015Day23Parser  interpret:
[[              |    |78.30000000000001 (13)  Array [SequenceableCollection]  do:
[[              |    |  78.30000000000001 (13)  AOC2015Day23Parser  interpret:
[[              |    |    25.0 (4)  AOC2015Day23Parser  jieA
[[              |    |      |20.5 (3)  AOC2015Day23Parser  plusInt
[[              |    |      |  20.5 (3)  ByteSymbol [Symbol]  asPParser
[[              |    |      |    20.5 (3)  PP2NodeFactory  digit
[[              |    |      |      20.5 (3)  PP2CharSetPredicate class  on:
[[              |    |      |        20.5 (3)  PP2CharSetPredicate  initializeOn:
[[              |    |      |          20.5 (3)  Character class  codePoint:
[[              |    |    13.700000000000001 (2)  AOC2015Day23Parser  jmp
[[              |    |      |13.700000000000001 (2)  AOC2015Day23Parser  plusInt
[[              |    |      |  13.700000000000001 (2)  ByteSymbol [Symbol]  asPParser
[[              |    |      |    13.700000000000001 (2)  PP2NodeFactory  digit
[[              |    |      |      13.700000000000001 (2)  PP2CharSetPredicate class  on:
[[              |    |      |        13.700000000000001 (2)  PP2CharSetPredicate  initializeOn:
[[              |    |      |          13.700000000000001 (2)  Character class  codePoint:
[[              |    |    11.5 (2)  PP2LiteralSequenceNode [PP2Node]  parse:
[[              |    |      |11.5 (2)  PP2LiteralSequenceNode [PP2Node]  parseContext:
[[              |    |      |  11.5 (2)  PP2LiteralSequenceNode [PP2Node]  parseAdaptable:
[[              |    |      |    11.5 (2)  PP2LiteralSequenceNode [PP2Node]  parseAdaptableWithContext:
[[              |    |      |      7.7 (1)  PP2SequenceNode [PP2Node]  parseOn:
[[              |    |      |        |7.7 (1)  PP2Sequence  parseOn:
[[              |    |      |        |  7.7 (1)  PP2SequenceNode [PP2Node]  parseOn:
[[              |    |      |        |    7.7 (1)  PP2Sequence  parseOn:
[[              |    |      |        |      4.0 (1)  ByteString  at:
[[              |    |      |        |      3.7 (1)  PP2FlattenNode [PP2Node]  parseOn:
[[              |    |      |        |        3.7 (1)  PP2Flatten  parseOn:
[[              |    |      |        |          3.7 (1)  PP2PossesiveRepeatingNode [PP2Node]  parseOn:
[[              |    |      |        |            3.7 (1)  PP2PossesiveRepeating  parseOn:
[[              |    |      |        |              3.7 (1)  SmallInteger  <
[[              |    |      |      3.8000000000000003 (1)  PP2LiteralSequenceNode  parseOn:
[[              |    |      |        3.8000000000000003 (1)  PP2LiteralSequence  parseOn:
[[              |    |      |          3.8000000000000003 (1)  PP2InMemoryContext  next:
[[              |    |      |            3.8000000000000003 (1)  ArrayedCollection  size
[[              |    |    10.8 (2)  AOC2015Day23Parser  jioA
[[              |    |      |10.8 (2)  AOC2015Day23Parser  plusInt
[[              |    |      |  10.8 (2)  ByteSymbol [Symbol]  asPParser
[[              |    |      |    10.8 (2)  PP2NodeFactory  digit
[[              |    |      |      10.8 (2)  PP2CharSetPredicate class  on:
[[              |    |      |        10.8 (2)  PP2CharSetPredicate  initializeOn:
[[              |    |      |          3.8000000000000003 (1)  Behavior  basicNew
[[              |    |      |          3.7 (1)  PP2NodeFactory  digit
[[              |    |      |            |3.7 (1)  Character  isDigit
[[              |    |      |            |  3.7 (1)  Unicode class  isDigit:
[[              |    |      |            |    3.7 (1)  Unicode class  is:inCategory:
[[              |    |      |            |      3.7 (1)  SparseLargeTable  at:
[[              |    |      |            |        3.7 (1)  SparseLargeTable  noCheckAt:
[[              |    |      |          3.3000000000000003 (1)  Character class  codePoint:
[[              |    |    10.5 (2)  ByteString [String]  asInteger
[[              |    |      |7.2 (1)  ByteString [String]  asSignedInteger
[[              |    |      |  |7.2 (1)  Integer class  readFrom:
[[              |    |      |  |  7.2 (1)  Integer class  readFrom:base:
[[              |    |      |  |    7.2 (1)  NumberParser  nextIntegerBase:
[[              |    |      |  |      7.2 (1)  NumberParser  nextUnsignedIntegerBase:
[[              |    |      |  |        3.8000000000000003 (1)  ByteString  at:
[[              |    |      |  |        3.4000000000000004 (1)  NumberParser  nextUnsignedIntegerOrNilBase:
[[              |    |      |  |          3.4000000000000004 (1)  NumberParser  nextElementaryLargeIntegerBase:
[[              |    |      |  |            3.4000000000000004 (1)  ReadStream [PositionableStream]  peek
[[              |    |      |  |              3.4000000000000004 (1)  SmallInteger  *
[[              |    |      |3.4000000000000004 (1)  Object  at:
[[              |    |    3.5 (1)  AOC2015Day23Parser  incA
[[              |    |      |3.5 (1)  ByteString [String]  asPParser
[[              |    |      |  3.5 (1)  PP2LiteralSequenceNode class [PP2LiteralNode class]  on:
[[              |    |      |    3.5 (1)  ByteString [Object]  printString
[[              |    |      |      3.5 (1)  ByteString [Object]  printStringLimitedTo:
[[              |    |      |        3.5 (1)  ByteString [Object]  printStringLimitedTo:using:
[[              |    |      |          3.5 (1)  String class [SequenceableCollection class]  streamContents:limitedTo:
[[              |    |      |            3.5 (1)  ByteString [Object]  printStringLimitedTo:
[[              |    |      |              3.5 (1)  ByteString [String]  printOn:
[[              |    |      |                3.5 (1)  ByteString [String]  storeOn:
[[              |    |      |                  3.5 (1)  Character  =
[[              |    |    3.4000000000000004 (1)  AOC2015Day23Parser  incB
[[              |    |      3.4000000000000004 (1)  ByteString [String]  asPParser
[[              |    |        3.4000000000000004 (1)  PP2LiteralSequenceNode class [PP2LiteralNode class]  on:
[[              |    |          3.4000000000000004 (1)  ByteString [Object]  printString
[[              |    |            3.4000000000000004 (1)  ByteString [Object]  printStringLimitedTo:
[[              |    |              3.4000000000000004 (1)  ByteString [Object]  printStringLimitedTo:using:
[[              |    |                3.4000000000000004 (1)  String class [SequenceableCollection class]  streamContents:limitedTo:
[[              |    |                  3.4000000000000004 (1)  ByteString [Object]  printStringLimitedTo:
[[              |    |                    3.4000000000000004 (1)  ByteString [String]  printOn:
[[              |    |                      3.4000000000000004 (1)  ByteString [String]  storeOn:
[[              |    |                        3.4000000000000004 (1)  LimitedWriteStream  nextPut:
[[              |    |                          3.4000000000000004 (1)  ByteString  at:
[[              |  13.8 (2)  Object  at:
[[            8.0 (1)  ByteString [SequenceableCollection]  splitOn:
[[              8.0 (1)  Character [Object]  split:
[[                8.0 (1)  Character [Object]  split:do:
[[                  8.0 (1)  Character [Object]  split:indicesDo:
[[                    8.0 (1)  Character [Object]  split:do:
[[                      4.5 (1)  ByteString [SequenceableCollection]  copyFrom:to:
[[                        |4.5 (1)  ByteString class [String class]  new:
[[                        |  4.5 (1)  SmallInteger  -
[[                      3.4000000000000004 (1)  Character [Object]  split:
[[                        3.4000000000000004 (1)  Behavior  basicNew:

**Leaves**
37.4 (6)  Character class  codePoint:
17.1 (3)  Object  at:
11.100000000000001 (2)  ByteString  at:
4.5 (1)  SmallInteger  -
3.8000000000000003 (1)  ArrayedCollection  size
3.8000000000000003 (1)  Behavior  basicNew
3.7 (1)  SmallInteger  <
3.7 (1)  SparseLargeTable  noCheckAt:
3.5 (1)  Character  =
3.4000000000000004 (1)  Behavior  basicNew:
3.4000000000000004 (1)  SmallInteger  *

**Memory**
	old			+0 bytes
	young		+845,568 bytes
	used		+845,568 bytes
	free		-845,568 bytes

**GCs**
	full			0 totalling 0ms (0.0% uptime)
	incr		0 totalling 0ms (0.0% uptime)
	tenures		0
	root table	0 overflows

**Processes**
	Total process switches: 68
	Without Profiler: 12
	Stack page overflows: 248
	Stack page divorces: 22
```
