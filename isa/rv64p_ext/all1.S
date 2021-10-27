#include "riscv_test.h"
#include "test_macros.h"
RVTEST_RV64U
RVTEST_CODE_BEGIN



  TEST_kernel(2, x14, 0x000007B6000007B6);

TEST_PASSFAIL
RVTEST_CODE_END
  .data
RVTEST_DATA_BEGIN

data:
	.ascii	"\001\377\003\002"
	.ascii	"\0047\006\003"
	.ascii	"\001\377\003\002"
	.ascii	"\0047\006\003"
	.ascii	"\001\377\003\002"
	.ascii	"\0047\006\003"
	.ascii	"\001\377\003\002"
	.ascii	"\0047\006\003"
	.ascii	"\001\377\003\002"
	.ascii	"\0047\006\003"
	.ascii	"\001\377\003\002"
	.ascii	"\0047\006\003"
	
kernel:
	.ascii	"\001\001\001"
	.ascii	"\001\001\001"
	.ascii	"\001\001\001"
	.ascii	"\001\001\001"
	.ascii	"\001\001\001"
	.ascii	"\001\001\001"
	.ascii	"\001\001\001"
	.ascii	"\001\001\001"
	.ascii	"\001\001\001"
	.ascii	"\001\001\001"
	.ascii	"\001\001\001"
	.ascii	"\001\001\001"
	.ascii	"\001\001\001"
	.ascii	"\001\001\001"
	.ascii	"\001\001\001"
	.ascii	"\001\001\001"
	.ascii	"\001\001\001"
	.ascii	"\001\001\001" 

TEST_DATA
RVTEST_DATA_END
