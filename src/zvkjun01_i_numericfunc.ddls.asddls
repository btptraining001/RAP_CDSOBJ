@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS : Numeric Function'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZVKJUN01_I_NUMERICFUNC
  as select from zvkfeb01_dt_demo

{
  key id,
      char_field3                                        as description,

      //-- Source fields shown for reference
      dec_field,   // A  e.g. 100.00
      dec_field2,  // B  e.g. 025.000
      dec_field3,  // C  e.g. 123.456000 (high precision)
      fltp_field,  // positive float
      fltp_field2, // negative float  e.g. -123.456
      int1_field,  // small int
      int2_field,  // int2
      int4_field,  // int4

      //============================================================
      // GROUP A : ARITHMETIC OPERATORS
      // +  -  *  work on any numeric type.
      // /  requires BOTH operands to be FLTP.
      // For non-FLTP division use DIVISION() function (Group D).
      //============================================================

      //-- A1: Addition
      //   id=00021: 100.00 + 025.000 = 125.000
      dec_field + dec_field2                             as add_result,

      //-- A2: Subtraction
      //   id=00021: 100.00 - 025.000 = 75.000
      dec_field - dec_field2                             as sub_result,

      //-- A3: Multiplication
      //   id=00021: 100.00 * 025.000 = 2500.00000
      dec_field * dec_field2                             as mul_result,

      //-- A4: Division using / operator (FLTP only)
      //   Both operands must be FLTP type.
      //   id=00025: 16.0 / 2.0 = 8.0
      fltp_field / fltp_field2 * cast( -1 as abap.fltp ) as fltp_div_result,

      //-- A5: Chained arithmetic with parentheses
      //   id=00021: (100.00 + 25.000) * 2.000 = 250.000
      ( dec_field + dec_field2 ) * dec_field2            as chained_result,

      //============================================================
      // GROUP B : ABS
      // Returns the absolute (non-negative) value.
      // Works on all numeric types: INT, DEC, FLTP, CURR, QUAN.
      // Result type is same as input type.
      //============================================================

      //-- B1: ABS on positive DEC - no change
      //   id=00021: ABS(100.00) = 100.00
      abs( dec_field )                                   as abs_dec_positive,

      //-- B2: ABS on negative FLTP - sign removed
      //   id=00024: ABS(-123.456) = 123.456
      abs( fltp_field2 )                                 as abs_fltp_negative,

      //-- B3: ABS on INT4
      //   id=00021: ABS(100) = 100
      abs( int4_field )                                  as abs_int4,

      //============================================================
      // GROUP C : CEIL and FLOOR
      // CEIL: smallest integer value >= argument (rounds UP)
      // FLOOR: largest integer value <= argument (rounds DOWN)
      // Both work on all numeric types.
      // Behaviour on negative numbers is critical to understand:
      //   CEIL(-123.456) = -123  (less negative = upward)
      //   FLOOR(-123.456) = -124 (more negative = downward)
      //============================================================

      //-- C1: CEIL on positive DEC
      //   id=00024: CEIL(123.46) = 124
      ceil( dec_field )                                  as ceil_dec,

      //-- C3: FLOOR on positive DEC
      //   id=00024: FLOOR(123.46) = 123
      floor( dec_field )                                 as floor_dec,

      //-- C5: CEIL on whole number - no change
      //   id=00021: CEIL(100.00) = 100
      ceil( dec_field2 )                                 as ceil_whole,

      //-- C6: FLOOR on whole number - no change
      //   id=00021: FLOOR(100.00) = 100
      floor( dec_field2 )                                as floor_whole,

      //============================================================
      // GROUP D : ROUND
      // round( arg, pos )
      //   pos > 0 : round to pos decimal places on RIGHT of separator
      //   pos = 0 : round to nearest integer
      //   pos < 0 : round to LEFT of separator (tens, hundreds etc.)
      // Works on all numeric types.
      //============================================================

      //-- D1: ROUND to 2 decimal places
      //   id=00024: ROUND(123.456000, 2) = 123.46
      round( dec_field3, 2 )                             as round_2dp,

      //-- D2: ROUND to 4 decimal places
      //   id=00024: ROUND(123.456000, 4) = 123.4560
      round( dec_field3, 4 )                             as round_4dp,

      //-- D3: ROUND to 0 decimal places (nearest integer)
      //   id=00024: ROUND(123.456000, 0) = 123
      round( dec_field3, 0 )                             as round_0dp,

      //-- D4: ROUND with negative position (round to tens)
      //   id=00024: ROUND(123.456, -1) = 120
      round( dec_field3, -1 )                            as round_neg1,

      //-- D5: ROUND with negative position (round to hundreds)
      //   id=00024: ROUND(123.456, -2) = 100
      round( dec_field3, -2 )                            as round_neg2,

      //============================================================
      // GROUP E : DIV
      // div( arg1, arg2 )
      // Integer division - returns the integer quotient.
      // IMPORTANT: ONLY accepts INTEGER types (INT1/INT2/INT4/INT8).
      //            Do NOT use DEC, FLTP, CURR, or QUAN.
      // Sign rule: positive if same signs, negative if different.
      //============================================================

      //-- E1: DIV - basic integer division
      //   id=00023: DIV(17, 5) = 3  (int2=17, int1=5)
      div( int2_field, int1_field )                      as div_int2_by_int1,

      //-- E2: DIV - INT4 by INT1
      //   id=00023: DIV(300, 5) = 60
      div( int4_field, int1_field )                      as div_int4_by_int1,

      //-- E3: DIV - result is 0 when dividend < divisor
      //   id=00022: DIV(4, 12) = 0  (int2=4, int1=12)
      div( int2_field, int1_field )                      as div_less_than_one,

      //============================================================
      // GROUP F : MOD
      // mod( arg1, arg2 )
      // Returns the remainder after integer division.
      // IMPORTANT: ONLY accepts INTEGER types (INT1/INT2/INT4/INT8).
      // NOTE: CDS MOD can return NEGATIVE results when signs differ.
      //       ABAP MOD always returns positive - they are different!
      //============================================================

      //-- F1: MOD - basic remainder
      //   id=00023: MOD(17, 5) = 2  (int2=17, int1=5)
      mod( int2_field, int1_field )                      as mod_int2_by_int1,

      //-- F2: MOD - INT4 by INT1
      //   id=00023: MOD(300, 5) = 0  (300 is exactly divisible by 5)
      mod( int4_field, int1_field )                      as mod_int4_by_int1,

      //-- F3: MOD - where dividend < divisor, result = dividend
      //   id=00022: MOD(4, 12) = 4  (int2=4, int1=12)
      mod( int2_field, int1_field )                      as mod_less_than_divisor,

      //============================================================
      // GROUP G : DIVISION
      // division( arg1, arg2, decimals )
      // Real number division with result to specified decimal places.
      // Works on ALL numeric types (unlike DIV/MOD).
      // Result type is always DEC.
      // Third argument (decimals) must be an integer literal 0-6.
      //============================================================

      //-- G1: DIVISION with 0 decimal places (like DIV but for DEC)
      //   id=00022: DIVISION(200.00, 4.000, 0) = 50
      division( dec_field, dec_field2, 0 )               as division_0dp,

      //-- G2: DIVISION with 2 decimal places
      //   id=00021: DIVISION(100.00, 25.000, 2) = 4.00
      division( dec_field, dec_field2, 2 )               as division_2dp,

      //-- G3: DIVISION with 4 decimal places (shows precision)
      //   id=00023: DIVISION(300.00, 7.000, 4) = 42.8571
      division( dec_field, dec_field2, 4 )               as division_4dp,

      //-- G4: DIVISION on INT types (returns DEC result)
      //   id=00023: DIVISION(17, 5, 3) = 3.400  (int2=17, int1=5)
      division( int2_field, int1_field, 3 )              as division_int_3dp,


      //============================================================
      // GROUP H : COMBINED / NESTED EXPRESSIONS
      // Numeric functions can be nested and combined.
      //============================================================

      //-- H2: ROUND of arithmetic expression
      //   id=00021: ROUND(100.00 + 25.000, 1) = 125.0
      round( dec_field + dec_field2, 1 )                 as round_of_add,

      //-- H3: ABS of subtraction (distance between two values)
      //   id=00022: ABS(200.00 - 4.000) = 196.000
      abs( dec_field - dec_field2 )                      as abs_of_diff,

      //-- H4: DIVISION combined with ROUND
      //   id=00023: ROUND(DIVISION(300.00, 7.000, 6), 2) = 42.86
      round( division( dec_field, dec_field2, 6 ), 2 )   as round_of_division,

      //-- H5: Floor of multiplication
      //   id=00021: FLOOR(100.00 * 025.000) = FLOOR(2500.0) = 2500
      floor( dec_field * dec_field2 )                    as floor_of_mul
}

where
  category = 'ARITH'
