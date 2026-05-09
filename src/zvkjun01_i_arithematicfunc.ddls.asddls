@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS : ARITHEMATIC Function'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZVKJUN01_I_ARITHEMATICFUNC 
as select from zvkfeb01_dt_demo

{
  key id,
  char_field3      as description,
 
  //-- Source fields for reference
  int1_field,      // e.g. id=00021: 10
  int2_field,      // e.g. id=00021: 20
  int4_field,      // e.g. id=00021: 100
  int8_field,      // e.g. id=00021: 100000
  dec_field,       // e.g. id=00021: 100.00
  dec_field2,      // e.g. id=00021: 025.000
  dec_field3,      // e.g. id=00021: 100.000000
  fltp_field,      // e.g. id=00021: 100.0  (positive)
  fltp_field2,     // e.g. id=00021: -100.0 (negative)
 
  //============================================================
  // GROUP A : INTEGER ARITHMETIC  ( INT op INT = INT )
  // All operators +, -, * are valid between integer types.
  // / is NOT valid between integers - use division() instead.
  // Mixing INT1 + INT2 + INT4 is allowed - result is INT4.
  //============================================================
 
  //-- A1: INT4 + INT4  (addition)
  //   id=00021: 100 + 100 = 200
  int4_field + int4_field            as int_add,
 
  //-- A2: INT2 - INT1  (subtraction)
  //   id=00021: 20 - 10 = 10
  int2_field - int1_field            as int_sub,
 
  //-- A3: INT4 * INT2  (multiplication)
  //   id=00021: 100 * 20 = 2000
  int4_field * int2_field            as int_mul,
 
  //-- A4: INT mixed types ( INT1 + INT2 + INT4 = INT4 )
  //   id=00021: 10 + 20 + 100 = 130
  int1_field + int2_field + int4_field  as int_mixed_add,
 
  //-- A5: INT with unary minus (negation)
  //   id=00021: -(100) = -100
  -int4_field                        as int_negate,
 
  //-- A6: INT with literal
  //   id=00021: 100 + 50 = 150
  int4_field + 50                    as int_add_literal,
 
  //-- A7: INT subtraction from literal
  //   id=00021: 1000 - 100 = 900
  1000 - int4_field                  as literal_sub_int,
 
  //-- A8: INT8 + INT4  (large integer addition)
  //   id=00021: 100000 + 100 = 100100
  int8_field + int4_field            as int8_add_int4,
 
  //============================================================
  // GROUP B : DECIMAL ARITHMETIC  ( DEC op DEC = DEC )
  // +, -, * are valid.
  // Mixing DEC + INT is allowed - INT is promoted to DEC.
  // / is NOT valid between DEC types - use division() instead.
  // Result must fit within DEC(31,14) maximum.
  //============================================================
 
  //-- B1: DEC + DEC  (addition)
  //   id=00021: 100.00 + 025.000 = 125.000
  dec_field + dec_field2             as dec_add,
 
  //-- B2: DEC - DEC  (subtraction)
  //   id=00021: 100.00 - 025.000 = 75.000
  dec_field - dec_field2             as dec_sub,
 
  //-- B3: DEC * DEC  (multiplication)
  //   id=00021: 100.00 * 025.000 = 2500.00000
  dec_field * dec_field2             as dec_mul,
 
  //-- B4: DEC + INT  (INT is promoted to DEC automatically)
  //   id=00021: 100.00 + 100 = 200.00
  dec_field + int4_field             as dec_add_int,
 
  //-- B5: DEC - INT  (INT promoted to DEC)
  //   id=00021: 100.00 - 10 = 90.00
  dec_field - int1_field             as dec_sub_int,
 
  //-- B6: DEC * INT  (INT promoted to DEC)
  //   id=00021: 100.00 * 20 = 2000.00
  dec_field * int2_field             as dec_mul_int,
 
  //-- B7: DEC3 high precision arithmetic
  //   id=00021: 100.000000 + 025.000000 = 125.000000
  dec_field3 + dec_field2            as dec3_add,
 
  //-- B8: Unary minus on DEC
  //   id=00021: -(100.00) = -100.00
  -dec_field                         as dec_negate,
 
  //-- B9: DEC with numeric literal
  //   id=00021: 100.00 + 0.50 = 100.50
  //   Note: 0.50 is a numeric literal with decimal so it is FLTP.
  //   To add a decimal literal to DEC, cast it first.
  dec_field + cast( fltp_to_dec( 0.50 as abap.dec(4,2) )
                    as abap.dec(10,2) )  as dec_add_dec_literal,
 
  //============================================================
  // GROUP C : FLTP ARITHMETIC  ( FLTP op FLTP = FLTP )
  // All operators +, -, *, / are valid between FLTP types.
  // / is the ONLY place where / operator is valid in CDS.
  // IMPORTANT: Do NOT mix FLTP with DEC or INT directly.
  //            Use CAST to convert before mixing.
  //============================================================
 
  //-- C1: FLTP + FLTP  (addition)
  //   id=00021: 100.0 + 100.0 = 200.0
  //   fltp_field2 is negative so abs() used to get positive value
  fltp_field + abs( fltp_field2 )    as fltp_add,
 
  //-- C2: FLTP - FLTP  (subtraction with negative)
  //   id=00024: 123.456 - (-123.456) = 246.912
  fltp_field - fltp_field2           as fltp_sub,
 
  //-- C3: FLTP * FLTP  (multiplication)
  //   id=00025: 16.0 * 16.0 = 256.0  (both use fltp_field)
  fltp_field * fltp_field            as fltp_mul,
 
  //-- C4: FLTP / FLTP  (division - ONLY valid use of / in CDS)
  //   id=00025: 16.0 / 16.0 = 1.0
  //   id=00021: 100.0 / 100.0 = 1.0
  fltp_field / fltp_field            as fltp_div,
 
  //-- C5: FLTP / FLTP with negative
  //   id=00024: 123.456 / abs(-123.456) = 1.0
  fltp_field / abs( fltp_field2 )    as fltp_div_abs,
 
  //-- C6: Unary minus on FLTP
  //   id=00021: -(100.0) = -100.0
  -fltp_field                        as fltp_negate,
 
  //============================================================
  // GROUP D : MIXED TYPE ARITHMETIC WITH CAST
  // FLTP cannot be mixed directly with DEC or INT.
  // Use CAST to bring operands to the same type first.
  //============================================================
 
  //-- D1: INT4 cast to FLTP, then FLTP arithmetic
  //   id=00025: cast(16 as FLTP) + 0.0 = 16.0
  cast( int4_field as abap.fltp )
    + fltp_field                     as int_cast_to_fltp_add,
 
  //-- D2: DEC cast to FLTP, then FLTP division
  //   id=00025: cast(16.00 as FLTP) / 2.0 = 8.0
  cast( dec_field as abap.fltp )
    / fltp_field2 * cast( -1 as abap.fltp )  as dec_cast_to_fltp_div,
 
  //-- D3: INT4 cast to DEC, then DEC arithmetic
  //   id=00021: cast(100 as DEC) + 100.00 = 200.00
  cast( int4_field as abap.dec(10,2) )
    + dec_field                      as int_cast_to_dec_add,
 
  //============================================================
  // GROUP E : PARENTHESES AND OPERATOR PRECEDENCE
  // Standard BODMAS: * before +/-
  // Parentheses override precedence.
  //============================================================
 
  //-- E1: Without parentheses - * before +
  //   id=00021: 100.00 + 025.000 * int4(100) = 100 + 2500 = 2600
  dec_field + dec_field2 * int4_field    as no_paren_bodmas,
 
  //-- E2: With parentheses - + before *
  //   id=00021: (100.00 + 025.000) * 100 = 125 * 100 = 12500
  ( dec_field + dec_field2 ) * int4_field  as paren_override,
 
  //-- E3: Nested parentheses
  //   id=00021: ((100.00 - 25.000) + 10) * 2 = 85 * 2 = 170
  ( ( dec_field - dec_field2 ) + int2_field ) * int1_field  as nested_paren,
 
  //-- E4: Complex expression
  //   id=00022: (200.00 * 4.000) - (200.00 + 4.000) = 800 - 204 = 596
  ( dec_field * dec_field2 ) - ( dec_field + dec_field2 )   as complex_expr,
 
  //============================================================
  // GROUP F : ARITHMETIC WITH CURRENCY AND QUANTITY FIELDS
  // CURR and QUAN are treated as DEC in arithmetic expressions.
  // Result loses semantic meaning so no @Semantics annotation.
  //============================================================
 
////  //-- F1: CURR field in arithmetic (treated as DEC)
////  //   Note: result is a plain DEC, no currency semantics.
////  //   id=00021: curr_field + dec_field = 100.00 + 100.00 = 200.00
////  @Semantics.amount.currencyCode: 'currency_key'
////  curr_field,
////  curr_field + dec_field             as curr_plus_dec,
 
////  //-- F2: QUAN field in arithmetic (treated as DEC)
////  @Semantics.quantity.unitOfMeasure: 'unit_key'
////  quan_field,
////  quan_field + dec_field2            as quan_plus_dec,
 
  //============================================================
  // GROUP G : ARITHMETIC WITH TYPED LITERALS
  // Typed literals ensure the correct type is used.
  // Avoids accidental FLTP introduction from decimal literals.
  //============================================================
 
  //-- G1: Add typed INT4 literal to INT4 field
  //   id=00021: 100 + 1000 = 1100
  int4_field + abap.int4'1000'       as int_typed_literal_add,
 
  //-- G2: Subtract typed INT4 literal
  //   id=00021: 100 - 1 = 99
  int4_field - abap.int4'1'          as int_typed_literal_sub,
 
  //-- G3: Multiply INT4 by typed literal
  //   id=00021: 100 * 3 = 300
  int4_field * abap.int4'3'          as int_typed_literal_mul,
 
  //============================================================
  // Reference fields needed for @Semantics above
  //============================================================
  currency_key,
  unit_key
}

  where category = 'ARITH'
