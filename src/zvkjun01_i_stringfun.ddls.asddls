@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS : String Function'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZVKJUN01_I_STRINGFUN
  as select from zvkfeb01_dt_demo
{
      //-- Key
  key id,

      //-- Source fields (shown for reference)
      char_field1, // e.g. 'ABCDEF'
      char_field2, // e.g. 'helloworld'
      char_field3, // e.g. '   Hello World        '
      char_field4, // e.g. 'John-Doe-Smith'
      char_field5, // e.g. 'AB'

      //------------------------------------------------------------
      // 1. LENGTH
      //    Returns number of characters, ignoring trailing blanks.
      //    char_field1 = 'ABCDEF'  → 6
      //    char_field5 = 'AB'      → 2  (trailing spaces ignored)
      //------------------------------------------------------------
      length( char_field1 )                              as len_char1,
      length( char_field5 )                              as len_char5_no_trail,

      //------------------------------------------------------------
      // 2. CONCAT
      //    Joins two strings with no separator.
      //    'ABCDEF' || 'helloworld' → 'ABCDEFhelloworld'
      //------------------------------------------------------------
      concat( char_field1, char_field2 )                 as concat_1_2,

      //------------------------------------------------------------
      // 3. CONCAT_WITH_SPACE
      //    Joins two strings with n spaces in between.
      //    'ABCDEF' + 2 spaces + 'helloworld' → 'ABCDEF  helloworld'
      //------------------------------------------------------------
      concat_with_space( char_field1, char_field2, 2 )   as concat_with_space_1_2,

      //------------------------------------------------------------
      // 4. UPPER
      //    Converts all characters to uppercase.
      //    'helloworld' → 'HELLOWORLD'
      //------------------------------------------------------------
      upper( char_field2 )                               as upper_char2,

      //------------------------------------------------------------
      // 5. LOWER
      //    Converts all characters to lowercase.
      //    'ABCDEF' → 'abcdef'
      //------------------------------------------------------------
      lower( char_field1 )                               as lower_char1,

      //------------------------------------------------------------
      // 6. LEFT
      //    Returns the leftmost n characters.
      //    LEFT('John-Doe-Smith', 4) → 'John'
      //------------------------------------------------------------
      left( char_field4, 4 )                             as left_4_char4,

      //------------------------------------------------------------
      // 7. RIGHT
      //    Returns the rightmost n characters.
      //    RIGHT('John-Doe-Smith', 5) → 'Smith'
      //------------------------------------------------------------
      right( char_field4, 5 )                            as right_5_char4,

      //------------------------------------------------------------
      // 8. SUBSTRING
      //    Extracts a substring starting at position pos (1-based)
      //    for length len characters.
      //    SUBSTRING('John-Doe-Smith', 6, 3) → 'Doe'
      //------------------------------------------------------------
      substring( char_field4, 6, 3 )                     as substr_pos6_len3,

      //------------------------------------------------------------
      // 9. INSTR
      //    Returns the position (1-based) of the first occurrence
      //    of the search string. Returns 0 if not found.
      //    INSTR('John-Doe-Smith', '-') → 5
      //------------------------------------------------------------
      instr( char_field4, '-' )                          as instr_dash,

      //------------------------------------------------------------
      // 10. REPLACE
      //     Replaces ALL occurrences of search string with replace
      //     string.
      //     REPLACE('John-Doe-Smith', '-', ' ') → 'John Doe Smith'
      //------------------------------------------------------------
      replace( char_field4, '-', ' ' )                   as replace_dash_space,

      //------------------------------------------------------------
      // 11. LTRIM
      //     Removes leading occurrences of the specified character.
      //     char_field3 = '   Hello World        '
      //     LTRIM(char_field3, ' ') → 'Hello World        '
      //------------------------------------------------------------
      ltrim( char_field3, ' ' )                          as ltrimmed,

      //------------------------------------------------------------
      // 12. RTRIM
      //     Removes trailing occurrences of the specified character.
      //     char_field3 = '   Hello World        '
      //     RTRIM(char_field3, ' ') → '   Hello World'
      //------------------------------------------------------------
      rtrim( char_field3, ' ' )                          as rtrimmed,

      //------------------------------------------------------------
      // 13. LPAD
      //     Left-pads the string to total width n using pad char.
      //     First RTRIM to remove trailing spaces, then pad.
      //     LPAD('AB', 8, '*') → '******AB'
      //------------------------------------------------------------
      lpad( rtrim( char_field5, ' ' ), 8, '*' )          as lpadded_8_star,

      //------------------------------------------------------------
      // 14. RPAD
      //     Right-pads the string to total width n using pad char.
      //     RPAD('AB', 8, '*') → 'AB******'
      //------------------------------------------------------------
      rpad( rtrim( char_field5, ' ' ), 8, '*' )          as rpadded_8_star,

      //------------------------------------------------------------
      // 15. BINTOHEX  (Byte String Function)
      //     Converts a RAW field to its hexadecimal CHAR
      //     representation.
      //     raw_data = x'0A0B0C0D0E0F0102' → '0A0B0C0D0E0F0102'
      //------------------------------------------------------------
      bintohex( raw_data )                               as raw_as_hex,


      //------------------------------------------------------------
      // COMBINED / NESTED EXAMPLES
      //------------------------------------------------------------

      //-- Full trim: remove both leading and trailing spaces
      //   LTRIM + RTRIM combined on char_field3
      //   '   Hello World        ' → 'Hello World'
      ltrim( rtrim( char_field3, ' ' ), ' ' )            as fully_trimmed,

      //-- Build a display label: UPPER of trimmed char_field3
      //   → 'HELLO WORLD'
      upper( ltrim( rtrim( char_field3, ' ' ), ' ' ) )   as trimmed_upper,

      //-- Extract second segment from 'John-Doe-Smith'
      //   We know first dash is at pos 5, so segment 2 starts at 6
      //   SUBSTRING + INSTR combined:
      //   LEFT up to first dash → 'John'
      left( char_field4, instr( char_field4, '-' ) - 1 ) as before_first_dash

//      //-- Concat char_field1 (upper) + '-' + char_field2 (upper)
//      //   concat_with_space does not support nesting and 0 spaces
//      //   is invalid. Use chained concat instead.
//      //   'ABCDEF' + '-' + 'HELLOWORLD' → 'ABCDEF-HELLOWORLD'
//      concat(
//        concat( upper( char_field1 ), '-' ),
//        upper( char_field2 )
//      )                                       as combined_upper_label                                                 as combined_upper_label
}
