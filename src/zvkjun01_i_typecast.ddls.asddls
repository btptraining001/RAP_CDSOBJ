@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS : Type Casting'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZVKJUN01_I_TYPECAST

  as select from zvkfeb01_dt_demo

{
  key id,

      //============================================================
      // GROUP A : NUMERIC → NUMERIC
      // INT1 / INT2 / INT4 / INT8 / DEC / CURR / QUAN
      // can all be cast to INT1/INT2/INT4/INT8/DEC/QUAN/CURR/FLTP
      //============================================================

      //-- A1: INT1 → INT4
      //   int1_field = 1  →  1
      int1_field,
      cast( int1_field as abap.int4 )             as int1_to_int4,

      //-- A2: INT2 → INT4
      //   int2_field = 31  →  31
      int2_field,
      cast( int2_field as abap.int4 )             as int2_to_int4,

      //-- A3: INT4 → INT8
      //   int4_field = 12345  →  12345
      int4_field,
      cast( int4_field as abap.int8 )             as int4_to_int8,

      //-- A4: INT4 → DEC(10,2)
      //   int4_field = 12345  →  12345.00
      cast( int4_field as abap.dec(10,2) )        as int4_to_dec,

      //-- A5: INT4 → FLTP
      //   int4_field = 12345  →  1.2345E+4 (binary float)
      cast( int4_field as abap.fltp )             as int4_to_fltp,

      //-- A6: INT8 → DEC(15,0)
      //   int8_field = 1234567890  →  1234567890
      int8_field,
      cast( int8_field as abap.dec(15,0) )        as int8_to_dec,

      //-- A7: DEC → INT4  (decimal places are cut off, no rounding)
      //   dec_field = 099.99  →  99
      dec_field,
      cast( dec_field as abap.int4 )              as dec_to_int4,

      //-- A8: DEC → FLTP
      //   dec_field = 099.99  →  9.999E+1 (binary float)
      cast( dec_field as abap.fltp )              as dec_to_fltp,

      //-- A9: DEC → DEC with different precision
      //   dec_field dec(10,2)  →  dec(15,6)  value preserved
      cast( dec_field as abap.dec(15,6) )         as dec_to_dec_wide,

      //-- A10: CURR → DEC
      //   curr_field curr(10,2) = 031.00  →  dec(10,2) = 31.00
      @Semantics.amount.currencyCode: 'currency_key'
      curr_field,
      cast( curr_field as abap.dec(10,2) )        as curr_to_dec,

      //-- A11: QUAN → DEC
      //   quan_field quan(10,3) = 031.000  →  dec(10,3) = 31.000
      @Semantics.quantity.unitOfMeasure: 'unit_key'
      quan_field,
      cast( quan_field as abap.dec(10,3) )        as quan_to_dec,

      //============================================================
      // GROUP B : NUMERIC → CHAR
      // INT / DEC / CURR / QUAN → CHAR or SSTRING
      // Result is left-aligned in mathematical notation.
      // Target length must accommodate sign + all digits + separator.
      //============================================================

      //-- B1: INT4 → CHAR(15)
      //   int4_field = 12345  →  '12345          ' (left-aligned)
      cast( int4_field as abap.char(15) )         as int4_to_char,

      //-- B2: INT8 → CHAR(20)
      //   int8_field = 1234567890  →  '1234567890          '
      cast( int8_field as abap.char(20) )         as int8_to_char,

      //-- B3: DEC(10,2) → CHAR(15)
      //   dec_field = 099.99  →  '99.99          '
      //   Note: leading zeros before decimal point may be stripped by DB
      cast( dec_field as abap.char(15) )          as dec_to_char,

      //-- B4: DEC → SSTRING
      //   dec_field = 099.99  →  sstring '99.99'
      cast( dec_field as abap.sstring(20) )       as dec_to_sstring,

      //============================================================
      // GROUP C : CHAR → CHAR-LIKE
      // CHAR / SSTRING → CHAR, SSTRING, NUMC, DATS, TIMS, CUKY, UNIT
      //============================================================

      //-- C1: CHAR → CHAR (widening - pad with blanks on right)
      //   char_field1 char(6) = 'CT0001'  →  char(10) = 'CT0001    '
      char_field1,
      cast( char_field1 as abap.char(10) )        as char6_to_char10,

      //-- C2: CHAR → SSTRING
      //   char_field1 char(6) = 'CT0001'  →  sstring(10) = 'CT0001'
      cast( char_field1 as abap.sstring(10) )     as char_to_sstring,

      //-- C3: CHAR(8) → DATS
      //   date_as_char char(8) = '20250701'  →  dats 20250701
      //   Source must contain a valid YYYYMMDD value.
      date_as_char,
      cast( date_as_char as abap.dats )           as char_to_dats,

      //-- C4: CHAR(6) → TIMS
      //   time_as_char char(6) = '070000'  →  tims 070000
      //   Source must contain a valid HHMMSS value.
      time_as_char,
      cast( time_as_char as abap.tims )           as char_to_tims,

      //============================================================
      // GROUP D : NUMC → NUMERIC
      // NUMC can be cast to INT / DEC / CURR / QUAN / FLTP
      // Source value must not contain decimal places for INT targets.
      //============================================================

      //-- D1: NUMC(6) → INT4
      //   numc_field1 = '654321'  →  654321
      numc_field1,
      cast( numc_field1 as abap.int4 )            as numc6_to_int4,

      //-- D2: NUMC(10) → INT8
      //   numc_field2 = '0000000031'  →  31
      numc_field2,
      cast( numc_field2 as abap.int8 )            as numc10_to_int8,

      //-- D3: NUMC(6) → DEC(8,2)
      //   numc_field1 = '654321'  →  654321.00
      cast( numc_field1 as abap.dec(8,2) )        as numc_to_dec,

      //-- D4: NUMC(6) → FLTP
      //   numc_field1 = '654321'  →  6.54321E+5
      cast( numc_field1 as abap.fltp )            as numc_to_fltp,

      //============================================================
      // GROUP E : NUMC → CHAR-LIKE
      // NUMC → CHAR, SSTRING, DATS, TIMS (lengths must match exactly
      // for DATS and TIMS targets)
      //============================================================

      //-- E1: NUMC(6) → CHAR(6)
      //   numc_field1 = '654321'  →  '654321'
      cast( numc_field1 as abap.char(6) )         as numc_to_char,

      //-- E2: NUMC(6) → SSTRING(6)
      cast( numc_field1 as abap.sstring(6) )      as numc_to_sstring,

      //============================================================
      // GROUP F : DATS / TIMS → CHAR
      // DATS and TIMS can only be cast to CHAR or SSTRING.
      //============================================================

      //-- F1: DATS → CHAR(8)
      //   date_field = 20250701  →  '20250701'
      date_field,
      cast( date_field as abap.char(8) )          as dats_to_char,

      //-- F2: DATS → SSTRING(8)
      cast( date_field as abap.sstring(8) )       as dats_to_sstring,

      //-- F3: TIMS → CHAR(6)
      //   time_field = 070000  →  '070000'
      time_field,
      cast( time_field as abap.char(6) )          as tims_to_char,

      //-- F4: TIMS → SSTRING(6)
      cast( time_field as abap.sstring(6) )       as tims_to_sstring,

      //============================================================
      // GROUP G : FLTP → DEC  (Special function: fltp_to_dec)
      // CAST cannot convert FLTP to DEC/CURR/QUAN.
      // The special function fltp_to_dec() must be used instead.
      // Surplus decimal places are cut off without rounding.
      //============================================================

      //-- G1: FLTP → DEC(10,0)  (integer part only)
      //   fltp_field = 3.14159265358979  →  3
      fltp_field,
      fltp_to_dec( fltp_field as abap.dec(10,0) ) as fltp_to_dec_0dp,

      //-- G2: FLTP → DEC(10,2)  (2 decimal places, no rounding)
      //   fltp_field = 3.14159265358979  →  3.14
      fltp_to_dec( fltp_field as abap.dec(10,2) ) as fltp_to_dec_2dp,

      //-- G3: FLTP → DEC(10,5)  (5 decimal places)
      //   fltp_field = 3.14159265358979  →  3.14159
      fltp_to_dec( fltp_field as abap.dec(10,5) ) as fltp_to_dec_5dp,

      //============================================================
      // GROUP H : LITERAL CASTING
      // Casting typed literals directly - useful for fixed values
      // in computed fields or CASE expressions.
      //============================================================

      //-- H1: Char literal → DATS
      //   Hardcoded date string cast to date type
      cast( '20260101' as abap.dats )             as literal_to_dats,

      //-- H2: Char literal → TIMS
      cast( '120000' as abap.tims )               as literal_to_tims,

      //-- H3: Numeric literal → DEC
      //   Useful for constants in calculations
      cast( '100' as abap.dec(5,0) )              as literal_to_dec,

      //-- H4: Numeric literal → INT4
      cast( '999' as abap.int4 )                  as literal_to_int4,

      //============================================================
      // Reference fields needed for @Semantics above
      //============================================================
      currency_key,
      unit_key
}

where
  category = 'CAST'
