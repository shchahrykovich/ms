## Finalizer
bp CoreCLR!FinalizerThread::FinalizerThreadStart
!name2ee *!MyClass
!DumpMT -MD 00007ffa417c5350
!DumpMD /d 00007ffa417c5290
bp 00007ffa41b605f0
dx g_FinalizerLoopCount
dx g_FinalizerIsRunning
bp AllocateObject

dx flag
dt MethodTable::WFLAGS_HIGH_ENUM

dt SOS!FinalizeQueue
bp SOS!FinalizeQueue

### Commands
p  - Target executes one instruction. If this instruction is a function call, that function is executed as a single step.
t  - Target executes one instruction. If this instruction is a function call, debugger traces into that call.
tt - Target executes until it reaches a return instruction. If the current instruction is a return instruction, the instruction is traced into until a new return is reached.

