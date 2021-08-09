# See LICENSE for license details.

#*****************************************************************************
# add.S
#-----------------------------------------------------------------------------
#
# Test add instruction.
#

#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN

  #-------------------------------------------------------------
  # Arithmetic tests
  #-------------------------------------------------------------

  TEST_RR_OP( 2,  sub8, 0xFFFF, 0x007F, 0x0180 );
  TEST_RR_OP( 3,  add8, 0x00003002, 0x00001001, 0x00002001 );
  TEST_RR_OP( 4,  add16, 0x2222444466668888, 0x1111222233334444, 0x1111222233334444 );

  TEST_RR_OP( 5,  add32, 0x22446688aaccaacc, 0x1122334455665566, 0x1122334455665566 );
  TEST_RR_OP( 6,  add64, 0xffffffff80000000, 0xffffffff80000000, 0x00000000 );
  TEST_RR_OP( 7,  kadd16, 0x7FFF8000C000, 0x7FFF80004000, 0x7FFF80008000 );

  TEST_RR_OP( 8,  radd16, 0x7FFF8000E000, 0x7FFF80004000, 0x7FFF80008000 );
  TEST_RR_OP( 9,  ukadd16, 0xFFFFC000, 0x80004000, 0x80008000 );
  TEST_RR_OP( 10, uradd16, 0x7FFF80006000, 0x7FFF80004000, 0x7FFF80008000 );

  TEST_RR_OP( 11, cras16, 0x00010001, 0x00008000, 0x7FFF0001 );
  TEST_RR_OP( 12, rcras16, 0xFFFF0000E0006000, 0x7FFF7FFF80004000, 0x7FFF800080004000 );

  TEST_RR_OP( 13, urcras16, 0x7FFF00007FFFE000, 0x7FFF7FFF80004000, 0x7FFF800080007FFF );
  TEST_RR_OP( 14, kcras16, 0xFFFF0000FFFF7FFF, 0x7FFF7FFF80004000, 0x7FFF800080007FFF );
  TEST_RR_OP( 15, ukcras16, 0xFFFF0000FFFF0000, 0x7FFF800080004000, 0x8000800080007FFF );

  TEST_RR_OP( 16, add, 0x0000000080000000, 0x0000000000000001, 0x000000007fffffff );

  #-------------------------------------------------------------
  # Source/Destination tests
  #-------------------------------------------------------------

  TEST_RR_SRC1_EQ_DEST( 17, add, 24, 13, 11 );
  TEST_RR_SRC2_EQ_DEST( 18, sub8, 3, 14, 11 );
  TEST_RR_SRC12_EQ_DEST( 19, add, 26, 13 );

  #-------------------------------------------------------------
  # Bypassing tests
  #-------------------------------------------------------------

  TEST_RR_DEST_BYPASS( 20, 0, add, 24, 13, 11 );
  TEST_RR_DEST_BYPASS( 21, 1, add, 25, 14, 11 );
  TEST_RR_DEST_BYPASS( 22, 2, add, 26, 15, 11 );

  TEST_RR_SRC12_BYPASS( 23, 0, 0, add, 24, 13, 11 );
  TEST_RR_SRC12_BYPASS( 24, 0, 1, add, 25, 14, 11 );
  TEST_RR_SRC12_BYPASS( 25, 0, 2, add, 26, 15, 11 );
  TEST_RR_SRC12_BYPASS( 26, 1, 0, add, 24, 13, 11 );
  TEST_RR_SRC12_BYPASS( 27, 1, 1, add, 25, 14, 11 );
  TEST_RR_SRC12_BYPASS( 28, 2, 0, add, 26, 15, 11 );

  TEST_RR_SRC21_BYPASS( 29, 0, 0, add, 24, 13, 11 );
  TEST_RR_SRC21_BYPASS( 30, 0, 1, add, 25, 14, 11 );
  TEST_RR_SRC21_BYPASS( 31, 0, 2, add, 26, 15, 11 );
  TEST_RR_SRC21_BYPASS( 32, 1, 0, add, 24, 13, 11 );
  TEST_RR_SRC21_BYPASS( 33, 1, 1, add, 25, 14, 11 );
  TEST_RR_SRC21_BYPASS( 34, 2, 0, add, 26, 15, 11 );

  TEST_RR_ZEROSRC1( 35, add, 15, 15 );
  TEST_RR_ZEROSRC2( 36, add, 32, 32 );
  TEST_RR_ZEROSRC12( 37, add, 0 );
  TEST_RR_ZERODEST( 38, add, 16, 30 );

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
