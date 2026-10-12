// ABC's checked C allocation helpers report exhaustion to the embedding
// C++ caller. Keep the throw here so ABC itself can still be compiled as C.
#include <new>
#include "misc/util/abc_global.h"

ABC_NAMESPACE_IMPL_START

void Abc_ThrowBadAlloc( void )
{
    throw std::bad_alloc();
}

ABC_NAMESPACE_IMPL_END
