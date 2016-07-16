## CoreCLR exceptions

### Code
HCIMPL1(void, IL_Throw,  Object* obj)
\coreclr\src\vm\jithelpers.cpp


### Throw null
C#   -> throw null;
Code -> if (oref == 0)
            COMPlusThrow(kNullReferenceException);


### Non compliant exception
Code -> if (!IsException(oref->GetMethodTable()))


### Out of memory
if (g_CLRPolicyRequested &&
            oref->GetMethodTable() == g_pOutOfMemoryExceptionClass)
        {
            EEPolicy::HandleOutOfMemory();
        }