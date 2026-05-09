CLASS zcl_vkfeb01_load_demo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zcl_vkfeb01_load_demo IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA lt_demo  TYPE STANDARD TABLE OF zvkfeb01_dt_demo.
    DATA ls_demo  TYPE zvkfeb01_dt_demo.
    DATA lv_ts    TYPE utclong.

    "==========================================================
    " HELPER: build a utclong from date + time
    "==========================================================

    "==========================================================
    " GROUP 1 : AGGREGATE FUNCTIONS
    " Purpose  : COUNT / SUM / AVG / MIN / MAX / COUNT DISTINCT
    " Design   : category+region repeated across rows so GROUP BY
    "            produces meaningful aggregated results
    " IDs      : 00001 – 00005
    "==========================================================

    CLEAR ls_demo.
    ls_demo-client       = sy-mandt.
    ls_demo-id           = '00001'.
    ls_demo-category     = 'ELECTRON'.
    ls_demo-region       = 'NORTH'.
    ls_demo-char_field1  = 'LAPTOP'.
    ls_demo-char_field2  = 'laptop pro'.
    ls_demo-char_field3  = '  Laptop Pro 15 inch  '.
    ls_demo-char_field4  = 'Brand-Model-001'.
    ls_demo-char_field5  = 'AB'.
    ls_demo-numc_field1  = '000100'.
    ls_demo-numc_field2  = '0000000001'.
    ls_demo-lang_field   = 'E'.
    ls_demo-string_field = 'Laptop Pro 15 inch display'.
    ls_demo-sstring_field = 'LaptopPro15'.
    ls_demo-date_field   = '20250101'.
    ls_demo-time_field   = '080000'.
    CONVERT DATE ls_demo-date_field TIME ls_demo-time_field
            TIME ZONE 'UTC' INTO UTCLONG lv_ts.
    ls_demo-timestamp_field = lv_ts.
    ls_demo-accp_field   = '202501'.
    ls_demo-date_as_char = '20250101'.
    ls_demo-time_as_char = '080000'.
    ls_demo-int1_field   = 10.
    ls_demo-int2_field   = 100.
    ls_demo-int4_field   = 50000.
    ls_demo-int8_field   = 5000000000.
    ls_demo-dec_field    = '1200.00'.
    ls_demo-dec_field2   = '100.500'.
    ls_demo-dec_field3   = '1200.000000'.
    ls_demo-fltp_field   = '1200.5'.
    ls_demo-fltp_field2  = '-1200.5'.
    ls_demo-curr_field   = '1199.99'.
    ls_demo-quan_field   = '010.000'.
    ls_demo-currency_key = 'USD'.
    ls_demo-unit_key     = 'EA'.
    ls_demo-is_active    = 'X'.
    ls_demo-raw_data     = '0102030405060708'.
    ls_demo-num_as_char  = '0000050000'.
    ls_demo-dec_as_char  = '000001200.00'.
    APPEND ls_demo TO lt_demo.

    CLEAR ls_demo.
    ls_demo-client       = sy-mandt.
    ls_demo-id           = '00002'.
    ls_demo-category     = 'ELECTRON'.
    ls_demo-region       = 'NORTH'.
    ls_demo-char_field1  = 'PHONE'.
    ls_demo-char_field2  = 'smartphone'.
    ls_demo-char_field3  = '  Smart Phone 128GB   '.
    ls_demo-char_field4  = 'Apple-iPhone-001'.
    ls_demo-char_field5  = 'CD'.
    ls_demo-numc_field1  = '000200'.
    ls_demo-numc_field2  = '0000000002'.
    ls_demo-lang_field   = 'E'.
    ls_demo-string_field = 'Smart Phone 128GB storage'.
    ls_demo-sstring_field = 'SmartPhone128'.
    ls_demo-date_field   = '20250201'.
    ls_demo-time_field   = '090000'.
    CONVERT DATE ls_demo-date_field TIME ls_demo-time_field
            TIME ZONE 'UTC' INTO UTCLONG lv_ts.
    ls_demo-timestamp_field = lv_ts.
    ls_demo-accp_field   = '202502'.
    ls_demo-date_as_char = '20250201'.
    ls_demo-time_as_char = '090000'.
    ls_demo-int1_field   = 20.
    ls_demo-int2_field   = 200.
    ls_demo-int4_field   = 80000.
    ls_demo-int8_field   = 8000000000.
    ls_demo-dec_field    = '800.00'.
    ls_demo-dec_field2   = '050.250'.
    ls_demo-dec_field3   = '800.000000'.
    ls_demo-fltp_field   = '800.5'.
    ls_demo-fltp_field2  = '-800.5'.
    ls_demo-curr_field   = '799.99'.
    ls_demo-quan_field   = '020.000'.
    ls_demo-currency_key = 'USD'.
    ls_demo-unit_key     = 'EA'.
    ls_demo-is_active    = 'X'.
    ls_demo-raw_data     = '1112131415161718'.
    ls_demo-num_as_char  = '0000080000'.
    ls_demo-dec_as_char  = '000000800.00'.
    APPEND ls_demo TO lt_demo.

    CLEAR ls_demo.
    ls_demo-client       = sy-mandt.
    ls_demo-id           = '00003'.
    ls_demo-category     = 'ELECTRON'.
    ls_demo-region       = 'SOUTH'.
    ls_demo-char_field1  = 'TABLET'.
    ls_demo-char_field2  = 'tabletmini'.
    ls_demo-char_field3  = 'Tablet Mini 64GB     '.
    ls_demo-char_field4  = 'Samsung-Tab-001'.
    ls_demo-char_field5  = 'EF'.
    ls_demo-numc_field1  = '000300'.
    ls_demo-numc_field2  = '0000000003'.
    ls_demo-lang_field   = 'D'.
    ls_demo-string_field = 'Tablet Mini 64GB internal storage'.
    ls_demo-sstring_field = 'TabletMini64'.
    ls_demo-date_field   = '20250301'.
    ls_demo-time_field   = '100000'.
    CONVERT DATE ls_demo-date_field TIME ls_demo-time_field
            TIME ZONE 'UTC' INTO UTCLONG lv_ts.
    ls_demo-timestamp_field = lv_ts.
    ls_demo-accp_field   = '202503'.
    ls_demo-date_as_char = '20250301'.
    ls_demo-time_as_char = '100000'.
    ls_demo-int1_field   = 30.
    ls_demo-int2_field   = 300.
    ls_demo-int4_field   = 30000.
    ls_demo-int8_field   = 3000000000.
    ls_demo-dec_field    = '500.00'.
    ls_demo-dec_field2   = '025.750'.
    ls_demo-dec_field3   = '500.000000'.
    ls_demo-fltp_field   = '500.75'.
    ls_demo-fltp_field2  = '-500.75'.
    ls_demo-curr_field   = '499.99'.
    ls_demo-quan_field   = '005.000'.
    ls_demo-currency_key = 'USD'.
    ls_demo-unit_key     = 'EA'.
    ls_demo-is_active    = 'X'.
    ls_demo-raw_data     = '2122232425262728'.
    ls_demo-num_as_char  = '0000030000'.
    ls_demo-dec_as_char  = '000000500.00'.
    APPEND ls_demo TO lt_demo.

    CLEAR ls_demo.
    ls_demo-client       = sy-mandt.
    ls_demo-id           = '00004'.
    ls_demo-category     = 'FOOD'.
    ls_demo-region       = 'EAST'.
    ls_demo-char_field1  = 'RICE'.
    ls_demo-char_field2  = 'basmati'.
    ls_demo-char_field3  = '     Basmati Rice 25KG'.
    ls_demo-char_field4  = 'Mill-Rice-25KG'.
    ls_demo-char_field5  = 'GH'.
    ls_demo-numc_field1  = '000400'.
    ls_demo-numc_field2  = '0000000004'.
    ls_demo-lang_field   = 'F'.
    ls_demo-string_field = 'Basmati Rice 25KG premium quality'.
    ls_demo-sstring_field = 'BasmatiRice25KG'.
    ls_demo-date_field   = '20250401'.
    ls_demo-time_field   = '110000'.
    CONVERT DATE ls_demo-date_field TIME ls_demo-time_field
            TIME ZONE 'UTC' INTO UTCLONG lv_ts.
    ls_demo-timestamp_field = lv_ts.
    ls_demo-accp_field   = '202504'.
    ls_demo-date_as_char = '20250401'.
    ls_demo-time_as_char = '110000'.
    ls_demo-int1_field   = 40.
    ls_demo-int2_field   = 400.
    ls_demo-int4_field   = 1200.
    ls_demo-int8_field   = 120000000.
    ls_demo-dec_field    = '045.00'.
    ls_demo-dec_field2   = '010.000'.
    ls_demo-dec_field3   = '045.000000'.
    ls_demo-fltp_field   = '45.0'.
    ls_demo-fltp_field2  = '-45.0'.
    ls_demo-curr_field   = '044.50'.
    ls_demo-quan_field   = '025.000'.
    ls_demo-currency_key = 'INR'.
    ls_demo-unit_key     = 'KG'.
    ls_demo-is_active    = 'X'.
    ls_demo-raw_data     = '3132333435363738'.
    ls_demo-num_as_char  = '0000001200'.
    ls_demo-dec_as_char  = '000000045.00'.
    APPEND ls_demo TO lt_demo.

    CLEAR ls_demo.
    ls_demo-client       = sy-mandt.
    ls_demo-id           = '00005'.
    ls_demo-category     = 'FOOD'.
    ls_demo-region       = 'EAST'.
    ls_demo-char_field1  = 'WHEAT'.
    ls_demo-char_field2  = 'wheatflour'.
    ls_demo-char_field3  = 'Whole Wheat Flour 10KG'.
    ls_demo-char_field4  = 'Mill-Wheat-10KG'.
    ls_demo-char_field5  = 'IJ'.
    ls_demo-numc_field1  = '000500'.
    ls_demo-numc_field2  = '0000000005'.
    ls_demo-lang_field   = 'F'.
    ls_demo-string_field = 'Whole Wheat Flour 10KG stone ground'.
    ls_demo-sstring_field = 'WheatFlour10KG'.
    ls_demo-date_field   = '20250501'.
    ls_demo-time_field   = '120000'.
    CONVERT DATE ls_demo-date_field TIME ls_demo-time_field
            TIME ZONE 'UTC' INTO UTCLONG lv_ts.
    ls_demo-timestamp_field = lv_ts.
    ls_demo-accp_field   = '202505'.
    ls_demo-date_as_char = '20250501'.
    ls_demo-time_as_char = '120000'.
    ls_demo-int1_field   = 50.
    ls_demo-int2_field   = 500.
    ls_demo-int4_field   = 800.
    ls_demo-int8_field   = 80000000.
    ls_demo-dec_field    = '030.00'.
    ls_demo-dec_field2   = '005.500'.
    ls_demo-dec_field3   = '030.000000'.
    ls_demo-fltp_field   = '30.0'.
    ls_demo-fltp_field2  = '-30.0'.
    ls_demo-curr_field   = '029.75'.
    ls_demo-quan_field   = '010.000'.
    ls_demo-currency_key = 'INR'.
    ls_demo-unit_key     = 'KG'.
    ls_demo-is_active    = ' '.
    ls_demo-raw_data     = '4142434445464748'.
    ls_demo-num_as_char  = '0000000800'.
    ls_demo-dec_as_char  = '000000030.00'.
    APPEND ls_demo TO lt_demo.

    "==========================================================
    " GROUP 2 : STRING FUNCTIONS
    " Purpose  : CONCAT / UPPER / LOWER / LTRIM / RTRIM /
    "            REPLACE / SUBSTRING / LEFT / RIGHT /
    "            LPAD / RPAD / LENGTH / INSTR
    " Design   :
    "   char_field1 = UPPERCASE  → LOWER demo
    "   char_field2 = lowercase  → UPPER demo
    "   char_field3 = spaces around text → LTRIM / RTRIM demo
    "   char_field4 = 'Part-Part-Part' → REPLACE / INSTR / SUBSTRING
    "   char_field5 = 'XY' short → LPAD / RPAD / LENGTH
    " IDs      : 00011 – 00015
    "==========================================================

    CLEAR ls_demo.
    ls_demo-client       = sy-mandt.
    ls_demo-id           = '00011'.
    ls_demo-category     = 'STRFUNC'.
    ls_demo-region       = 'DEMO'.
    ls_demo-char_field1  = 'ABCDEF'.        " LOWER → 'abcdef'
    ls_demo-char_field2  = 'helloworld'.    " UPPER → 'HELLOWORLD'
    ls_demo-char_field3  = '   Hello World        '.  " LTRIM+RTRIM → 'Hello World'
    ls_demo-char_field4  = 'John-Doe-Smith'.           " INSTR('-')=5, REPLACE→'John Doe Smith'
    ls_demo-char_field5  = 'AB'.            " LPAD(8,'*')→'******AB' RPAD→'AB******'
    ls_demo-numc_field1  = '000011'.
    ls_demo-numc_field2  = '0000000011'.
    ls_demo-lang_field   = 'E'.
    ls_demo-string_field = 'The quick brown fox jumps over the lazy dog'.
    ls_demo-sstring_field = 'StringDemo01'.
    ls_demo-date_field   = '20250601'.
    ls_demo-time_field   = '060000'.
    CONVERT DATE ls_demo-date_field TIME ls_demo-time_field
            TIME ZONE 'UTC' INTO UTCLONG lv_ts.
    ls_demo-timestamp_field = lv_ts.
    ls_demo-accp_field   = '202506'.
    ls_demo-date_as_char = '20250601'.
    ls_demo-time_as_char = '060000'.
    ls_demo-int1_field   = 1.
    ls_demo-int2_field   = 11.
    ls_demo-int4_field   = 1111.
    ls_demo-int8_field   = 1111111111.
    ls_demo-dec_field    = '111.11'.
    ls_demo-dec_field2   = '011.111'.
    ls_demo-dec_field3   = '111.111111'.
    ls_demo-fltp_field   = '111.11'.
    ls_demo-fltp_field2  = '-111.11'.
    ls_demo-curr_field   = '111.00'.
    ls_demo-quan_field   = '011.000'.
    ls_demo-currency_key = 'USD'.
    ls_demo-unit_key     = 'EA'.
    ls_demo-is_active    = 'X'.
    ls_demo-raw_data     = '0A0B0C0D0E0F0102'.
    ls_demo-num_as_char  = '0000001111'.
    ls_demo-dec_as_char  = '000000111.11'.
    APPEND ls_demo TO lt_demo.

    CLEAR ls_demo.
    ls_demo-client       = sy-mandt.
    ls_demo-id           = '00012'.
    ls_demo-category     = 'STRFUNC'.
    ls_demo-region       = 'DEMO'.
    ls_demo-char_field1  = 'GHIJKL'.        " LOWER → 'ghijkl'
    ls_demo-char_field2  = 'sap abap'.      " UPPER → 'SAP ABAP'
    ls_demo-char_field3  = '      CDS Views       '.  " 6 leading, 7 trailing spaces
    ls_demo-char_field4  = 'New-York-City'. " INSTR('-')=4, SUBSTRING(1,3)='New'
    ls_demo-char_field5  = 'XY'.
    ls_demo-numc_field1  = '000012'.
    ls_demo-numc_field2  = '0000000012'.
    ls_demo-lang_field   = 'D'.
    ls_demo-string_field = 'CDS stands for Core Data Services in SAP'.
    ls_demo-sstring_field = 'StringDemo02'.
    ls_demo-date_field   = '20250602'.
    ls_demo-time_field   = '120000'.
    CONVERT DATE ls_demo-date_field TIME ls_demo-time_field
            TIME ZONE 'UTC' INTO UTCLONG lv_ts.
    ls_demo-timestamp_field = lv_ts.
    ls_demo-accp_field   = '202506'.
    ls_demo-date_as_char = '20250602'.
    ls_demo-time_as_char = '120000'.
    ls_demo-int1_field   = 2.
    ls_demo-int2_field   = 22.
    ls_demo-int4_field   = 2222.
    ls_demo-int8_field   = 2222222222.
    ls_demo-dec_field    = '222.22'.
    ls_demo-dec_field2   = '022.222'.
    ls_demo-dec_field3   = '222.222222'.
    ls_demo-fltp_field   = '222.22'.
    ls_demo-fltp_field2  = '-222.22'.
    ls_demo-curr_field   = '222.00'.
    ls_demo-quan_field   = '022.000'.
    ls_demo-currency_key = 'EUR'.
    ls_demo-unit_key     = 'EA'.
    ls_demo-is_active    = 'X'.
    ls_demo-raw_data     = '1A1B1C1D1E1F1011'.
    ls_demo-num_as_char  = '0000002222'.
    ls_demo-dec_as_char  = '000000222.22'.
    APPEND ls_demo TO lt_demo.

    CLEAR ls_demo.
    ls_demo-client       = sy-mandt.
    ls_demo-id           = '00013'.
    ls_demo-category     = 'STRFUNC'.
    ls_demo-region       = 'DEMO'.
    ls_demo-char_field1  = 'MNOPQR'.
    ls_demo-char_field2  = 'abapcloud'.     " UPPER → 'ABAPCLOUD'
    ls_demo-char_field3  = 'NoSpacesHereAtAll     '.  " LTRIM unchanged, RTRIM strips
    ls_demo-char_field4  = 'India-Asia-World'.  " INSTR('-')=6
    ls_demo-char_field5  = '12'.
    ls_demo-numc_field1  = '000013'.
    ls_demo-numc_field2  = '0000000013'.
    ls_demo-lang_field   = 'F'.
    ls_demo-string_field = 'ABAP RESTful Application Programming Model'.
    ls_demo-sstring_field = 'StringDemo03'.
    ls_demo-date_field   = '20250603'.
    ls_demo-time_field   = '180000'.
    CONVERT DATE ls_demo-date_field TIME ls_demo-time_field
            TIME ZONE 'UTC' INTO UTCLONG lv_ts.
    ls_demo-timestamp_field = lv_ts.
    ls_demo-accp_field   = '202506'.
    ls_demo-date_as_char = '20250603'.
    ls_demo-time_as_char = '180000'.
    ls_demo-int1_field   = 3.
    ls_demo-int2_field   = 33.
    ls_demo-int4_field   = 3333.
    ls_demo-int8_field   = 3333333333.
    ls_demo-dec_field    = '333.33'.
    ls_demo-dec_field2   = '033.333'.
    ls_demo-dec_field3   = '333.333333'.
    ls_demo-fltp_field   = '333.33'.
    ls_demo-fltp_field2  = '-333.33'.
    ls_demo-curr_field   = '333.00'.
    ls_demo-quan_field   = '033.000'.
    ls_demo-currency_key = 'GBP'.
    ls_demo-unit_key     = 'EA'.
    ls_demo-is_active    = ' '.
    ls_demo-raw_data     = '2A2B2C2D2E2F2021'.
    ls_demo-num_as_char  = '0000003333'.
    ls_demo-dec_as_char  = '000000333.33'.
    APPEND ls_demo TO lt_demo.

    CLEAR ls_demo.
    ls_demo-client       = sy-mandt.
    ls_demo-id           = '00014'.
    ls_demo-category     = 'STRFUNC'.
    ls_demo-region       = 'DEMO'.
    ls_demo-char_field1  = 'STUVWX'.
    ls_demo-char_field2  = 'fiorilaun'.     " UPPER → 'FIORILAUN'
    ls_demo-char_field3  = '   Fiori Launchpad    '.
    ls_demo-char_field4  = 'Prod-Sub-Item'. " INSTR('-')=5
    ls_demo-char_field5  = 'Z'.
    ls_demo-numc_field1  = '000014'.
    ls_demo-numc_field2  = '0000000014'.
    ls_demo-lang_field   = 'J'.
    ls_demo-string_field = 'SAP Fiori Launchpad provides a unified entry point'.
    ls_demo-sstring_field = 'StringDemo04'.
    ls_demo-date_field   = '20250604'.
    ls_demo-time_field   = '093000'.
    CONVERT DATE ls_demo-date_field TIME ls_demo-time_field
            TIME ZONE 'UTC' INTO UTCLONG lv_ts.
    ls_demo-timestamp_field = lv_ts.
    ls_demo-accp_field   = '202506'.
    ls_demo-date_as_char = '20250604'.
    ls_demo-time_as_char = '093000'.
    ls_demo-int1_field   = 4.
    ls_demo-int2_field   = 44.
    ls_demo-int4_field   = 4444.
    ls_demo-int8_field   = 4444444444.
    ls_demo-dec_field    = '444.44'.
    ls_demo-dec_field2   = '044.444'.
    ls_demo-dec_field3   = '444.444444'.
    ls_demo-fltp_field   = '444.44'.
    ls_demo-fltp_field2  = '-444.44'.
    ls_demo-curr_field   = '444.00'.
    ls_demo-quan_field   = '044.000'.
    ls_demo-currency_key = 'INR'.
    ls_demo-unit_key     = 'EA'.
    ls_demo-is_active    = 'X'.
    ls_demo-raw_data     = '3A3B3C3D3E3F3031'.
    ls_demo-num_as_char  = '0000004444'.
    ls_demo-dec_as_char  = '000000444.44'.
    APPEND ls_demo TO lt_demo.

    CLEAR ls_demo.
    ls_demo-client       = sy-mandt.
    ls_demo-id           = '00015'.
    ls_demo-category     = 'STRFUNC'.
    ls_demo-region       = 'DEMO'.
    ls_demo-char_field1  = 'YZABCD'.
    ls_demo-char_field2  = 'odataserv'.     " UPPER → 'ODATASERV'
    ls_demo-char_field3  = '   OData Service      '.
    ls_demo-char_field4  = 'Srv-Ent-Set-Key'.  " multiple dashes
    ls_demo-char_field5  = 'P'.
    ls_demo-numc_field1  = '000015'.
    ls_demo-numc_field2  = '0000000015'.
    ls_demo-lang_field   = 'Z'.
    ls_demo-string_field = 'OData V4 Service for RAP Business Objects'.
    ls_demo-sstring_field = 'StringDemo05'.
    ls_demo-date_field   = '20250605'.
    ls_demo-time_field   = '153000'.
    CONVERT DATE ls_demo-date_field TIME ls_demo-time_field
            TIME ZONE 'UTC' INTO UTCLONG lv_ts.
    ls_demo-timestamp_field = lv_ts.
    ls_demo-accp_field   = '202506'.
    ls_demo-date_as_char = '20250605'.
    ls_demo-time_as_char = '153000'.
    ls_demo-int1_field   = 5.
    ls_demo-int2_field   = 55.
    ls_demo-int4_field   = 5555.
    ls_demo-int8_field   = 5555555555.
    ls_demo-dec_field    = '555.55'.
    ls_demo-dec_field2   = '055.555'.
    ls_demo-dec_field3   = '555.555555'.
    ls_demo-fltp_field   = '555.55'.
    ls_demo-fltp_field2  = '-555.55'.
    ls_demo-curr_field   = '555.00'.
    ls_demo-quan_field   = '055.000'.
    ls_demo-currency_key = 'JPY'.
    ls_demo-unit_key     = 'EA'.
    ls_demo-is_active    = ' '.
    ls_demo-raw_data     = '4A4B4C4D4E4F4041'.
    ls_demo-num_as_char  = '0000005555'.
    ls_demo-dec_as_char  = '000000555.55'.
    APPEND ls_demo TO lt_demo.

    "==========================================================
    " GROUP 3 : ARITHMETIC EXPRESSIONS
    " Purpose  : + - * / DIV MOD ABS CEIL FLOOR ROUND POWER SQRT
    " Design   :
    "   00021 : A=100.00  B=25.000   → A+B=125 A-B=75
    "   00022 : A=200.00  B=4.000    → A*B=800 A/B=50
    "   00023 : int2=17   int1=5     → 17 DIV 5=3  17 MOD 5=2
    "   00024 : dec negative=-123.46 → ABS=123.46 CEIL=-123 FLOOR=-124
    "   00025 : int1=4    int2=2     → POWER(4,2)=16  SQRT(500)≈22.36
    " IDs      : 00021 – 00025
    "==========================================================

    CLEAR ls_demo.
    ls_demo-client       = sy-mandt.
    ls_demo-id           = '00021'.
    ls_demo-category     = 'ARITH'.
    ls_demo-region       = 'DEMO'.
    ls_demo-char_field1  = 'AR0001'.
    ls_demo-char_field2  = 'addsub'.
    ls_demo-char_field3  = 'Arithmetic Add Sub    '.
    ls_demo-char_field4  = 'Arith-Demo-001'.
    ls_demo-char_field5  = 'A'.
    ls_demo-numc_field1  = '000021'.
    ls_demo-numc_field2  = '0000000021'.
    ls_demo-lang_field   = 'E'.
    ls_demo-string_field = 'Arithmetic demo: addition and subtraction'.
    ls_demo-sstring_field = 'ArithAddSub'.
    ls_demo-date_field   = '20250101'.
    ls_demo-time_field   = '010101'.
    CONVERT DATE ls_demo-date_field TIME ls_demo-time_field
            TIME ZONE 'UTC' INTO UTCLONG lv_ts.
    ls_demo-timestamp_field = lv_ts.
    ls_demo-accp_field   = '202501'.
    ls_demo-date_as_char = '20250101'.
    ls_demo-time_as_char = '010101'.
    ls_demo-int1_field   = 10.   " operand for DIV/MOD
    ls_demo-int2_field   = 20.
    ls_demo-int4_field   = 100.
    ls_demo-int8_field   = 100000.
    ls_demo-dec_field    = '100.00'.   " A
    ls_demo-dec_field2   = '025.000'.  " B  → A+B=125 A-B=75
    ls_demo-dec_field3   = '100.000000'.
    ls_demo-fltp_field   = '100.0'.
    ls_demo-fltp_field2  = '-100.0'.
    ls_demo-curr_field   = '100.00'.
    ls_demo-quan_field   = '100.000'.
    ls_demo-currency_key = 'USD'.
    ls_demo-unit_key     = 'EA'.
    ls_demo-is_active    = 'X'.
    ls_demo-raw_data     = '0000000000000001'.
    ls_demo-num_as_char  = '0000000100'.
    ls_demo-dec_as_char  = '000000100.00'.
    APPEND ls_demo TO lt_demo.

    CLEAR ls_demo.
    ls_demo-client       = sy-mandt.
    ls_demo-id           = '00022'.
    ls_demo-category     = 'ARITH'.
    ls_demo-region       = 'DEMO'.
    ls_demo-char_field1  = 'AR0002'.
    ls_demo-char_field2  = 'muldiv'.
    ls_demo-char_field3  = 'Arithmetic Mul Div    '.
    ls_demo-char_field4  = 'Arith-Demo-002'.
    ls_demo-char_field5  = 'B'.
    ls_demo-numc_field1  = '000022'.
    ls_demo-numc_field2  = '0000000022'.
    ls_demo-lang_field   = 'E'.
    ls_demo-string_field = 'Arithmetic demo: multiplication and division'.
    ls_demo-sstring_field = 'ArithMulDiv'.
    ls_demo-date_field   = '20250102'.
    ls_demo-time_field   = '020202'.
    CONVERT DATE ls_demo-date_field TIME ls_demo-time_field
            TIME ZONE 'UTC' INTO UTCLONG lv_ts.
    ls_demo-timestamp_field = lv_ts.
    ls_demo-accp_field   = '202501'.
    ls_demo-date_as_char = '20250102'.
    ls_demo-time_as_char = '020202'.
    ls_demo-int1_field   = 12.
    ls_demo-int2_field   = 4.
    ls_demo-int4_field   = 200.
    ls_demo-int8_field   = 200000.
    ls_demo-dec_field    = '200.00'.   " A
    ls_demo-dec_field2   = '004.000'.  " B  → A*B=800 A/B=50
    ls_demo-dec_field3   = '200.000000'.
    ls_demo-fltp_field   = '200.0'.
    ls_demo-fltp_field2  = '-200.0'.
    ls_demo-curr_field   = '200.00'.
    ls_demo-quan_field   = '200.000'.
    ls_demo-currency_key = 'USD'.
    ls_demo-unit_key     = 'EA'.
    ls_demo-is_active    = 'X'.
    ls_demo-raw_data     = '0000000000000002'.
    ls_demo-num_as_char  = '0000000200'.
    ls_demo-dec_as_char  = '000000200.00'.
    APPEND ls_demo TO lt_demo.

    CLEAR ls_demo.
    ls_demo-client       = sy-mandt.
    ls_demo-id           = '00023'.
    ls_demo-category     = 'ARITH'.
    ls_demo-region       = 'DEMO'.
    ls_demo-char_field1  = 'AR0003'.
    ls_demo-char_field2  = 'divmod'.
    ls_demo-char_field3  = 'Arithmetic Div Mod    '.
    ls_demo-char_field4  = 'Arith-Demo-003'.
    ls_demo-char_field5  = 'C'.
    ls_demo-numc_field1  = '000023'.
    ls_demo-numc_field2  = '0000000023'.
    ls_demo-lang_field   = 'E'.
    ls_demo-string_field = 'Arithmetic demo: DIV integer division and MOD remainder'.
    ls_demo-sstring_field = 'ArithDivMod'.
    ls_demo-date_field   = '20250103'.
    ls_demo-time_field   = '030303'.
    CONVERT DATE ls_demo-date_field TIME ls_demo-time_field
            TIME ZONE 'UTC' INTO UTCLONG lv_ts.
    ls_demo-timestamp_field = lv_ts.
    ls_demo-accp_field   = '202501'.
    ls_demo-date_as_char = '20250103'.
    ls_demo-time_as_char = '030303'.
    ls_demo-int1_field   = 5.    " divisor  → 17 DIV 5 = 3
    ls_demo-int2_field   = 17.   " dividend → 17 MOD 5 = 2
    ls_demo-int4_field   = 300.
    ls_demo-int8_field   = 300000.
    ls_demo-dec_field    = '300.00'.
    ls_demo-dec_field2   = '007.000'.
    ls_demo-dec_field3   = '300.000000'.
    ls_demo-fltp_field   = '300.0'.
    ls_demo-fltp_field2  = '-300.0'.
    ls_demo-curr_field   = '300.00'.
    ls_demo-quan_field   = '300.000'.
    ls_demo-currency_key = 'EUR'.
    ls_demo-unit_key     = 'EA'.
    ls_demo-is_active    = ' '.
    ls_demo-raw_data     = '0000000000000003'.
    ls_demo-num_as_char  = '0000000300'.
    ls_demo-dec_as_char  = '000000300.00'.
    APPEND ls_demo TO lt_demo.

    CLEAR ls_demo.
    ls_demo-client       = sy-mandt.
    ls_demo-id           = '00024'.
    ls_demo-category     = 'ARITH'.
    ls_demo-region       = 'DEMO'.
    ls_demo-char_field1  = 'AR0004'.
    ls_demo-char_field2  = 'absceil'.
    ls_demo-char_field3  = 'Arithmetic Abs Ceil   '.
    ls_demo-char_field4  = 'Arith-Demo-004'.
    ls_demo-char_field5  = 'D'.
    ls_demo-numc_field1  = '000024'.
    ls_demo-numc_field2  = '0000000024'.
    ls_demo-lang_field   = 'E'.
    ls_demo-string_field = 'Arithmetic demo: ABS CEIL FLOOR ROUND on negative value'.
    ls_demo-sstring_field = 'ArithAbsCeil'.
    ls_demo-date_field   = '20250104'.
    ls_demo-time_field   = '040404'.
    CONVERT DATE ls_demo-date_field TIME ls_demo-time_field
            TIME ZONE 'UTC' INTO UTCLONG lv_ts.
    ls_demo-timestamp_field = lv_ts.
    ls_demo-accp_field   = '202501'.
    ls_demo-date_as_char = '20250104'.
    ls_demo-time_as_char = '040404'.
    ls_demo-int1_field   = 7.
    ls_demo-int2_field   = 3.
    ls_demo-int4_field   = 400.
    ls_demo-int8_field   = 400000.
    ls_demo-dec_field    = '123.46'.    " positive for dec(10,2)
    ls_demo-dec_field2   = '010.500'.
    ls_demo-dec_field3   = '123.456000'.
    ls_demo-fltp_field   = '123.456'.
    ls_demo-fltp_field2  = '-123.456'.  " negative → ABS=123.456 CEIL=-123 FLOOR=-124
    ls_demo-curr_field   = '400.00'.
    ls_demo-quan_field   = '400.000'.
    ls_demo-currency_key = 'GBP'.
    ls_demo-unit_key     = 'EA'.
    ls_demo-is_active    = 'X'.
    ls_demo-raw_data     = '0000000000000004'.
    ls_demo-num_as_char  = '0000000400'.
    ls_demo-dec_as_char  = '000000400.00'.
    APPEND ls_demo TO lt_demo.

    CLEAR ls_demo.
    ls_demo-client       = sy-mandt.
    ls_demo-id           = '00025'.
    ls_demo-category     = 'ARITH'.
    ls_demo-region       = 'DEMO'.
    ls_demo-char_field1  = 'AR0005'.
    ls_demo-char_field2  = 'powersqrt'.
    ls_demo-char_field3  = 'Arithmetic Power Sqrt '.
    ls_demo-char_field4  = 'Arith-Demo-005'.
    ls_demo-char_field5  = 'E'.
    ls_demo-numc_field1  = '000025'.
    ls_demo-numc_field2  = '0000000025'.
    ls_demo-lang_field   = 'E'.
    ls_demo-string_field = 'Arithmetic demo: POWER and SQRT functions'.
    ls_demo-sstring_field = 'ArithPowerSqrt'.
    ls_demo-date_field   = '20250105'.
    ls_demo-time_field   = '050505'.
    CONVERT DATE ls_demo-date_field TIME ls_demo-time_field
            TIME ZONE 'UTC' INTO UTCLONG lv_ts.
    ls_demo-timestamp_field = lv_ts.
    ls_demo-accp_field   = '202501'.
    ls_demo-date_as_char = '20250105'.
    ls_demo-time_as_char = '050505'.
    ls_demo-int1_field   = 4.    " POWER(4,2)=16
    ls_demo-int2_field   = 2.    " exponent
    ls_demo-int4_field   = 500.  " SQRT(500)≈22.36
    ls_demo-int8_field   = 500000.
    ls_demo-dec_field    = '016.00'.
    ls_demo-dec_field2   = '002.000'.
    ls_demo-dec_field3   = '016.000000'.
    ls_demo-fltp_field   = '16.0'.
    ls_demo-fltp_field2  = '-16.0'.
    ls_demo-curr_field   = '500.00'.
    ls_demo-quan_field   = '500.000'.
    ls_demo-currency_key = 'JPY'.
    ls_demo-unit_key     = 'EA'.
    ls_demo-is_active    = 'X'.
    ls_demo-raw_data     = '0000000000000005'.
    ls_demo-num_as_char  = '0000000500'.
    ls_demo-dec_as_char  = '000000500.00'.
    APPEND ls_demo TO lt_demo.

    "==========================================================
    " GROUP 4 : CAST / TYPE CONVERSION
    " Purpose  : Demonstrate every valid CAST direction in CDS
    "   num_as_char  → CAST to abap.int4
    "   dec_as_char  → CAST to abap.dec(10,2)
    "   date_as_char → CAST to abap.dats
    "   time_as_char → CAST to abap.tims
    "   int4_field   → CAST to abap.dec(10,2)
    "   int4_field   → CAST to abap.char(10)
    "   dec_field    → CAST to abap.char(12)
    "   numc_field1  → CAST to abap.char(6)
    "   fltp_field   → CAST to abap.dec(10,2)  (π=3.14)
    " IDs      : 00031 – 00035
    "==========================================================

    CLEAR ls_demo.
    ls_demo-client       = sy-mandt.
    ls_demo-id           = '00031'.
    ls_demo-category     = 'CAST'.
    ls_demo-region       = 'DEMO'.
    ls_demo-char_field1  = 'CT0001'.
    ls_demo-char_field2  = 'numtochar'.
    ls_demo-char_field3  = 'Cast char to int4     '.
    ls_demo-char_field4  = 'Cast-NumChar-001'.
    ls_demo-char_field5  = 'A'.
    ls_demo-numc_field1  = '654321'.
    ls_demo-numc_field2  = '0000000031'.
    ls_demo-lang_field   = 'E'.
    ls_demo-string_field = 'CAST num_as_char to INT4'.
    ls_demo-sstring_field = 'CastDemo01'.
    ls_demo-date_field   = '20250701'.
    ls_demo-time_field   = '070000'.
    CONVERT DATE ls_demo-date_field TIME ls_demo-time_field
            TIME ZONE 'UTC' INTO UTCLONG lv_ts.
    ls_demo-timestamp_field = lv_ts.
    ls_demo-accp_field   = '202507'.
    ls_demo-date_as_char = '20250701'.  " → CAST to DATS
    ls_demo-time_as_char = '070000'.    " → CAST to TIMS
    ls_demo-int1_field   = 1.
    ls_demo-int2_field   = 31.
    ls_demo-int4_field   = 12345.       " → CAST to CHAR(10)
    ls_demo-int8_field   = 1234567890.
    ls_demo-dec_field    = '099.99'.    " → CAST to CHAR(12)
    ls_demo-dec_field2   = '009.999'.
    ls_demo-dec_field3   = '099.999000'.
    ls_demo-fltp_field   = '99.99'.
    ls_demo-fltp_field2  = '-99.99'.
    ls_demo-curr_field   = '031.00'.
    ls_demo-quan_field   = '031.000'.
    ls_demo-currency_key = 'USD'.
    ls_demo-unit_key     = 'EA'.
    ls_demo-is_active    = 'X'.
    ls_demo-raw_data     = '0000000000000031'.
    ls_demo-num_as_char  = '0000012345'.   " → CAST to INT4 = 12345
    ls_demo-dec_as_char  = '000000099.99'. " → CAST to DEC = 99.99
    APPEND ls_demo TO lt_demo.

    CLEAR ls_demo.
    ls_demo-client       = sy-mandt.
    ls_demo-id           = '00032'.
    ls_demo-category     = 'CAST'.
    ls_demo-region       = 'DEMO'.
    ls_demo-char_field1  = 'CT0002'.
    ls_demo-char_field2  = 'dectoint'.
    ls_demo-char_field3  = 'Cast dec to char      '.
    ls_demo-char_field4  = 'Cast-DecChar-002'.
    ls_demo-char_field5  = 'B'.
    ls_demo-numc_field1  = '111111'.
    ls_demo-numc_field2  = '0000000032'.
    ls_demo-lang_field   = 'D'.
    ls_demo-string_field = 'CAST dec_field to CHAR and int4 to DEC'.
    ls_demo-sstring_field = 'CastDemo02'.
    ls_demo-date_field   = '20250702'.
    ls_demo-time_field   = '080000'.
    CONVERT DATE ls_demo-date_field TIME ls_demo-time_field
            TIME ZONE 'UTC' INTO UTCLONG lv_ts.
    ls_demo-timestamp_field = lv_ts.
    ls_demo-accp_field   = '202507'.
    ls_demo-date_as_char = '20250702'.
    ls_demo-time_as_char = '080000'.
    ls_demo-int1_field   = 2.
    ls_demo-int2_field   = 32.
    ls_demo-int4_field   = 67890.
    ls_demo-int8_field   = 6789012345.
    ls_demo-dec_field    = '199.99'.
    ls_demo-dec_field2   = '019.999'.
    ls_demo-dec_field3   = '199.999000'.
    ls_demo-fltp_field   = '199.99'.
    ls_demo-fltp_field2  = '-199.99'.
    ls_demo-curr_field   = '032.00'.
    ls_demo-quan_field   = '032.000'.
    ls_demo-currency_key = 'EUR'.
    ls_demo-unit_key     = 'EA'.
    ls_demo-is_active    = 'X'.
    ls_demo-raw_data     = '0000000000000032'.
    ls_demo-num_as_char  = '0000067890'.
    ls_demo-dec_as_char  = '000000199.99'.
    APPEND ls_demo TO lt_demo.

    CLEAR ls_demo.
    ls_demo-client       = sy-mandt.
    ls_demo-id           = '00033'.
    ls_demo-category     = 'CAST'.
    ls_demo-region       = 'DEMO'.
    ls_demo-char_field1  = 'CT0003'.
    ls_demo-char_field2  = 'chartodats'.
    ls_demo-char_field3  = 'Cast char to dats     '.
    ls_demo-char_field4  = 'Cast-Dats-003'.
    ls_demo-char_field5  = 'C'.
    ls_demo-numc_field1  = '222222'.
    ls_demo-numc_field2  = '0000000033'.
    ls_demo-lang_field   = 'F'.
    ls_demo-string_field = 'CAST date_as_char to DATS and time_as_char to TIMS'.
    ls_demo-sstring_field = 'CastDemo03'.
    ls_demo-date_field   = '20251231'.
    ls_demo-time_field   = '235959'.
    CONVERT DATE ls_demo-date_field TIME ls_demo-time_field
            TIME ZONE 'UTC' INTO UTCLONG lv_ts.
    ls_demo-timestamp_field = lv_ts.
    ls_demo-accp_field   = '202512'.
    ls_demo-date_as_char = '20251231'.  " year-end for clear demo
    ls_demo-time_as_char = '235959'.    " end of day for clear demo
    ls_demo-int1_field   = 3.
    ls_demo-int2_field   = 33.
    ls_demo-int4_field   = 54321.
    ls_demo-int8_field   = 5432109876.
    ls_demo-dec_field    = '299.99'.
    ls_demo-dec_field2   = '029.999'.
    ls_demo-dec_field3   = '299.999000'.
    ls_demo-fltp_field   = '299.99'.
    ls_demo-fltp_field2  = '-299.99'.
    ls_demo-curr_field   = '033.00'.
    ls_demo-quan_field   = '033.000'.
    ls_demo-currency_key = 'GBP'.
    ls_demo-unit_key     = 'EA'.
    ls_demo-is_active    = ' '.
    ls_demo-raw_data     = '0000000000000033'.
    ls_demo-num_as_char  = '0000054321'.
    ls_demo-dec_as_char  = '000000299.99'.
    APPEND ls_demo TO lt_demo.

    CLEAR ls_demo.
    ls_demo-client       = sy-mandt.
    ls_demo-id           = '00034'.
    ls_demo-category     = 'CAST'.
    ls_demo-region       = 'DEMO'.
    ls_demo-char_field1  = 'CT0004'.
    ls_demo-char_field2  = 'inttodec'.
    ls_demo-char_field3  = 'Cast int4 to dec      '.
    ls_demo-char_field4  = 'Cast-IntDec-004'.
    ls_demo-char_field5  = 'D'.
    ls_demo-numc_field1  = '333333'.
    ls_demo-numc_field2  = '0000000034'.
    ls_demo-lang_field   = 'J'.
    ls_demo-string_field = 'CAST int4 to DEC and numc to CHAR'.
    ls_demo-sstring_field = 'CastDemo04'.
    ls_demo-date_field   = '20250704'.
    ls_demo-time_field   = '100000'.
    CONVERT DATE ls_demo-date_field TIME ls_demo-time_field
            TIME ZONE 'UTC' INTO UTCLONG lv_ts.
    ls_demo-timestamp_field = lv_ts.
    ls_demo-accp_field   = '202507'.
    ls_demo-date_as_char = '20250704'.
    ls_demo-time_as_char = '100000'.
    ls_demo-int1_field   = 4.
    ls_demo-int2_field   = 34.
    ls_demo-int4_field   = 99999.       " → CAST to DEC(10,2) = 99999.00
    ls_demo-int8_field   = 9999999999.
    ls_demo-dec_field    = '399.99'.
    ls_demo-dec_field2   = '039.999'.
    ls_demo-dec_field3   = '399.999000'.
    ls_demo-fltp_field   = '399.99'.
    ls_demo-fltp_field2  = '-399.99'.
    ls_demo-curr_field   = '034.00'.
    ls_demo-quan_field   = '034.000'.
    ls_demo-currency_key = 'INR'.
    ls_demo-unit_key     = 'EA'.
    ls_demo-is_active    = 'X'.
    ls_demo-raw_data     = '0000000000000034'.
    ls_demo-num_as_char  = '0000099999'.
    ls_demo-dec_as_char  = '000000399.99'.
    APPEND ls_demo TO lt_demo.

    CLEAR ls_demo.
    ls_demo-client       = sy-mandt.
    ls_demo-id           = '00035'.
    ls_demo-category     = 'CAST'.
    ls_demo-region       = 'DEMO'.
    ls_demo-char_field1  = 'CT0005'.
    ls_demo-char_field2  = 'fltptodec'.
    ls_demo-char_field3  = 'Cast fltp to dec      '.
    ls_demo-char_field4  = 'Cast-Fltp-005'.
    ls_demo-char_field5  = 'E'.
    ls_demo-numc_field1  = '444444'.
    ls_demo-numc_field2  = '0000000035'.
    ls_demo-lang_field   = 'Z'.
    ls_demo-string_field = 'CAST fltp to DEC: pi=3.14159 rounded to 3.14'.
    ls_demo-sstring_field = 'CastDemo05'.
    ls_demo-date_field   = '20250705'.
    ls_demo-time_field   = '110000'.
    CONVERT DATE ls_demo-date_field TIME ls_demo-time_field
            TIME ZONE 'UTC' INTO UTCLONG lv_ts.
    ls_demo-timestamp_field = lv_ts.
    ls_demo-accp_field   = '202507'.
    ls_demo-date_as_char = '20250705'.
    ls_demo-time_as_char = '110000'.
    ls_demo-int1_field   = 5.
    ls_demo-int2_field   = 35.
    ls_demo-int4_field   = 11111.
    ls_demo-int8_field   = 1111111111.
    ls_demo-dec_field    = '003.14'.    " π rounded to dec(10,2)
    ls_demo-dec_field2   = '003.142'.   " π to dec(7,3)
    ls_demo-dec_field3   = '003.141593'. " π to dec(15,6)
    ls_demo-fltp_field   = '3.14159265358979'.  " full precision π
    ls_demo-fltp_field2  = '-3.14159265358979'.
    ls_demo-curr_field   = '035.00'.
    ls_demo-quan_field   = '035.000'.
    ls_demo-currency_key = 'JPY'.
    ls_demo-unit_key     = 'EA'.
    ls_demo-is_active    = 'X'.
    ls_demo-raw_data     = '0000000000000035'.
    ls_demo-num_as_char  = '0000011111'.
    ls_demo-dec_as_char  = '000000003.14'.
    APPEND ls_demo TO lt_demo.

    "==========================================================
    " GROUP 5 : CASE / COALESCE / NULLIF
    " Purpose  : CASE simple / CASE searched / NULLIF / COALESCE
    " Design   :
    "   00041 : is_active='X' int4=500   → Low band   NORTH discount
    "   00042 : is_active=' ' int4=5000  → Medium band SOUTH discount
    "   00043 : is_active='X' int4=50000 → High band   EAST discount
    "   00044 : is_active=' ' int4=0     → NULLIF(int4,0)=NULL
    "           dec_field=0.00           → NULLIF(dec,0.00)=NULL
    "   00045 : is_active='X' int4=99999 → COALESCE fallback demo
    " IDs      : 00041 – 00045
    "==========================================================

    CLEAR ls_demo.
    ls_demo-client       = sy-mandt.
    ls_demo-id           = '00041'.
    ls_demo-category     = 'CASE'.
    ls_demo-region       = 'NORTH'.
    ls_demo-char_field1  = 'CS0001'.
    ls_demo-char_field2  = 'active'.
    ls_demo-char_field3  = 'Case Demo Active      '.
    ls_demo-char_field4  = 'Case-Active-001'.
    ls_demo-char_field5  = 'A'.
    ls_demo-numc_field1  = '000041'.
    ls_demo-numc_field2  = '0000000041'.
    ls_demo-lang_field   = 'E'.
    ls_demo-string_field = 'CASE demo: active flag and Low value band'.
    ls_demo-sstring_field = 'CaseActive'.
    ls_demo-date_field   = '20250101'.
    ls_demo-time_field   = '010101'.
    CONVERT DATE ls_demo-date_field TIME ls_demo-time_field
            TIME ZONE 'UTC' INTO UTCLONG lv_ts.
    ls_demo-timestamp_field = lv_ts.
    ls_demo-accp_field   = '202501'.
    ls_demo-date_as_char = '20250101'.
    ls_demo-time_as_char = '010101'.
    ls_demo-int1_field   = 41.
    ls_demo-int2_field   = 410.
    ls_demo-int4_field   = 500.     " → 'Low' band (<=999)
    ls_demo-int8_field   = 500000.
    ls_demo-dec_field    = '010.00'.
    ls_demo-dec_field2   = '001.000'.
    ls_demo-dec_field3   = '010.000000'.
    ls_demo-fltp_field   = '10.0'.
    ls_demo-fltp_field2  = '-10.0'.
    ls_demo-curr_field   = '041.00'.
    ls_demo-quan_field   = '041.000'.
    ls_demo-currency_key = 'USD'.
    ls_demo-unit_key     = 'EA'.
    ls_demo-is_active    = 'X'.     " → 'Active'
    ls_demo-raw_data     = '0000000000000041'.
    ls_demo-num_as_char  = '0000000500'.
    ls_demo-dec_as_char  = '000000010.00'.
    APPEND ls_demo TO lt_demo.

    CLEAR ls_demo.
    ls_demo-client       = sy-mandt.
    ls_demo-id           = '00042'.
    ls_demo-category     = 'CASE'.
    ls_demo-region       = 'SOUTH'.
    ls_demo-char_field1  = 'CS0002'.
    ls_demo-char_field2  = 'inactive'.
    ls_demo-char_field3  = 'Case Demo Inactive    '.
    ls_demo-char_field4  = 'Case-Inact-002'.
    ls_demo-char_field5  = 'B'.
    ls_demo-numc_field1  = '000042'.
    ls_demo-numc_field2  = '0000000042'.
    ls_demo-lang_field   = 'D'.
    ls_demo-string_field = 'CASE demo: inactive flag and Medium value band'.
    ls_demo-sstring_field = 'CaseInactive'.
    ls_demo-date_field   = '20250202'.
    ls_demo-time_field   = '020202'.
    CONVERT DATE ls_demo-date_field TIME ls_demo-time_field
            TIME ZONE 'UTC' INTO UTCLONG lv_ts.
    ls_demo-timestamp_field = lv_ts.
    ls_demo-accp_field   = '202502'.
    ls_demo-date_as_char = '20250202'.
    ls_demo-time_as_char = '020202'.
    ls_demo-int1_field   = 42.
    ls_demo-int2_field   = 420.
    ls_demo-int4_field   = 5000.    " → 'Medium' band (<=9999)
    ls_demo-int8_field   = 5000000.
    ls_demo-dec_field    = '020.00'.
    ls_demo-dec_field2   = '002.000'.
    ls_demo-dec_field3   = '020.000000'.
    ls_demo-fltp_field   = '20.0'.
    ls_demo-fltp_field2  = '-20.0'.
    ls_demo-curr_field   = '042.00'.
    ls_demo-quan_field   = '042.000'.
    ls_demo-currency_key = 'EUR'.
    ls_demo-unit_key     = 'EA'.
    ls_demo-is_active    = ' '.     " → 'Inactive'
    ls_demo-raw_data     = '0000000000000042'.
    ls_demo-num_as_char  = '0000005000'.
    ls_demo-dec_as_char  = '000000020.00'.
    APPEND ls_demo TO lt_demo.

    CLEAR ls_demo.
    ls_demo-client       = sy-mandt.
    ls_demo-id           = '00043'.
    ls_demo-category     = 'CASE'.
    ls_demo-region       = 'EAST'.
    ls_demo-char_field1  = 'CS0003'.
    ls_demo-char_field2  = 'highvalue'.
    ls_demo-char_field3  = 'Case Demo High Val    '.
    ls_demo-char_field4  = 'Case-High-003'.
    ls_demo-char_field5  = 'C'.
    ls_demo-numc_field1  = '000043'.
    ls_demo-numc_field2  = '0000000043'.
    ls_demo-lang_field   = 'F'.
    ls_demo-string_field = 'CASE demo: active flag and High value band'.
    ls_demo-sstring_field = 'CaseHighVal'.
    ls_demo-date_field   = '20250303'.
    ls_demo-time_field   = '030303'.
    CONVERT DATE ls_demo-date_field TIME ls_demo-time_field
            TIME ZONE 'UTC' INTO UTCLONG lv_ts.
    ls_demo-timestamp_field = lv_ts.
    ls_demo-accp_field   = '202503'.
    ls_demo-date_as_char = '20250303'.
    ls_demo-time_as_char = '030303'.
    ls_demo-int1_field   = 43.
    ls_demo-int2_field   = 430.
    ls_demo-int4_field   = 50000.   " → 'High' band (<=99999)
    ls_demo-int8_field   = 50000000.
    ls_demo-dec_field    = '030.00'.
    ls_demo-dec_field2   = '003.000'.
    ls_demo-dec_field3   = '030.000000'.
    ls_demo-fltp_field   = '30.0'.
    ls_demo-fltp_field2  = '-30.0'.
    ls_demo-curr_field   = '043.00'.
    ls_demo-quan_field   = '043.000'.
    ls_demo-currency_key = 'GBP'.
    ls_demo-unit_key     = 'EA'.
    ls_demo-is_active    = 'X'.
    ls_demo-raw_data     = '0000000000000043'.
    ls_demo-num_as_char  = '0000050000'.
    ls_demo-dec_as_char  = '000000030.00'.
    APPEND ls_demo TO lt_demo.

    CLEAR ls_demo.
    ls_demo-client       = sy-mandt.
    ls_demo-id           = '00044'.
    ls_demo-category     = 'CASE'.
    ls_demo-region       = 'WEST'.
    ls_demo-char_field1  = 'CS0004'.
    ls_demo-char_field2  = 'nullif'.
    ls_demo-char_field3  = 'Case Demo NullIf      '.
    ls_demo-char_field4  = 'Case-Null-004'.
    ls_demo-char_field5  = 'D'.
    ls_demo-numc_field1  = '000044'.
    ls_demo-numc_field2  = '0000000044'.
    ls_demo-lang_field   = 'J'.
    ls_demo-string_field = 'NULLIF demo: int4=0 and dec=0.00 become NULL in CDS'.
    ls_demo-sstring_field = 'CaseNullIf'.
    ls_demo-date_field   = '20250404'.
    ls_demo-time_field   = '040404'.
    CONVERT DATE ls_demo-date_field TIME ls_demo-time_field
            TIME ZONE 'UTC' INTO UTCLONG lv_ts.
    ls_demo-timestamp_field = lv_ts.
    ls_demo-accp_field   = '202504'.
    ls_demo-date_as_char = '20250404'.
    ls_demo-time_as_char = '040404'.
    ls_demo-int1_field   = 44.
    ls_demo-int2_field   = 440.
    ls_demo-int4_field   = 0.       " NULLIF(int4_field,0) → NULL
    ls_demo-int8_field   = 0.
    ls_demo-dec_field    = '000.00'. " NULLIF(dec_field,0.00) → NULL
    ls_demo-dec_field2   = '000.000'.
    ls_demo-dec_field3   = '000.000000'.
    ls_demo-fltp_field   = '0.0'.
    ls_demo-fltp_field2  = '0.0'.
    ls_demo-curr_field   = '044.00'.
    ls_demo-quan_field   = '044.000'.
    ls_demo-currency_key = 'INR'.
    ls_demo-unit_key     = 'EA'.
    ls_demo-is_active    = ' '.
    ls_demo-raw_data     = '0000000000000044'.
    ls_demo-num_as_char  = '0000000000'.
    ls_demo-dec_as_char  = '000000000.00'.
    APPEND ls_demo TO lt_demo.

    CLEAR ls_demo.
    ls_demo-client       = sy-mandt.
    ls_demo-id           = '00045'.
    ls_demo-category     = 'CASE'.
    ls_demo-region       = 'NORTH'.
    ls_demo-char_field1  = 'CS0005'.
    ls_demo-char_field2  = 'coalesce'.
    ls_demo-char_field3  = 'Case Demo Coalesce    '.
    ls_demo-char_field4  = 'Case-Coal-005'.
    ls_demo-char_field5  = 'E'.
    ls_demo-numc_field1  = '000045'.
    ls_demo-numc_field2  = '0000000045'.
    ls_demo-lang_field   = 'Z'.
    ls_demo-string_field = 'COALESCE demo: non-zero values pass through'.
    ls_demo-sstring_field = 'CaseCoalesce'.
    ls_demo-date_field   = '20250505'.
    ls_demo-time_field   = '050505'.
    CONVERT DATE ls_demo-date_field TIME ls_demo-time_field
            TIME ZONE 'UTC' INTO UTCLONG lv_ts.
    ls_demo-timestamp_field = lv_ts.
    ls_demo-accp_field   = '202505'.
    ls_demo-date_as_char = '20250505'.
    ls_demo-time_as_char = '050505'.
    ls_demo-int1_field   = 45.
    ls_demo-int2_field   = 450.
    ls_demo-int4_field   = 99999.
    ls_demo-int8_field   = 99999999.
    ls_demo-dec_field    = '099.00'.
    ls_demo-dec_field2   = '009.000'.
    ls_demo-dec_field3   = '099.000000'.
    ls_demo-fltp_field   = '99.0'.
    ls_demo-fltp_field2  = '-99.0'.
    ls_demo-curr_field   = '045.00'.
    ls_demo-quan_field   = '045.000'.
    ls_demo-currency_key = 'JPY'.
    ls_demo-unit_key     = 'EA'.
    ls_demo-is_active    = 'X'.
    ls_demo-raw_data     = '0000000000000045'.
    ls_demo-num_as_char  = '0000099999'.
    ls_demo-dec_as_char  = '000000099.00'.
    APPEND ls_demo TO lt_demo.

    "==========================================================
    " GROUP 6 : DATE & TIME FUNCTIONS
    " Purpose  : DATS_IS_VALID / DATS_DAYS_BETWEEN / DATS_ADD_DAYS
    "            TSTMP_SECONDS_BETWEEN / TSTMP_ADD_SECONDS
    "            $session.system_date
    " Design   :
    "   00051 : date='20250101' int4=365  → ADD_DAYS → 20260101
    "           pair with 00052 → DAYS_BETWEEN = 364
    "   00052 : date='20251231'           → end of year
    "   00053 : date='00000000'           → DATS_IS_VALID = 0
    "   00054 : date='20250601' int4=30   → ADD_DAYS → 20250701
    "   00055 : int4=3600                 → TSTMP_ADD_SECONDS + 1 hour
    " IDs      : 00051 – 00055
    "==========================================================

    CLEAR ls_demo.
    ls_demo-client       = sy-mandt.
    ls_demo-id           = '00051'.
    ls_demo-category     = 'DATEFN'.
    ls_demo-region       = 'DEMO'.
    ls_demo-char_field1  = 'DT0001'.
    ls_demo-char_field2  = 'startdate'.
    ls_demo-char_field3  = 'Date Func Start       '.
    ls_demo-char_field4  = 'Date-Start-001'.
    ls_demo-char_field5  = 'A'.
    ls_demo-numc_field1  = '000051'.
    ls_demo-numc_field2  = '0000000051'.
    ls_demo-lang_field   = 'E'.
    ls_demo-string_field = 'Date function demo: base date 2025-01-01'.
    ls_demo-sstring_field = 'DateFuncStart'.
    ls_demo-date_field   = '20250101'.   " base date
    ls_demo-time_field   = '000000'.
    CONVERT DATE ls_demo-date_field TIME ls_demo-time_field
            TIME ZONE 'UTC' INTO UTCLONG lv_ts.
    ls_demo-timestamp_field = lv_ts.
    ls_demo-accp_field   = '202501'.
    ls_demo-date_as_char = '20250101'.
    ls_demo-time_as_char = '000000'.
    ls_demo-int1_field   = 51.
    ls_demo-int2_field   = 365.
    ls_demo-int4_field   = 365.    " DATS_ADD_DAYS(date,365) → 20260101
    ls_demo-int8_field   = 365000.
    ls_demo-dec_field    = '051.00'.
    ls_demo-dec_field2   = '005.100'.
    ls_demo-dec_field3   = '051.000000'.
    ls_demo-fltp_field   = '51.0'.
    ls_demo-fltp_field2  = '-51.0'.
    ls_demo-curr_field   = '051.00'.
    ls_demo-quan_field   = '051.000'.
    ls_demo-currency_key = 'USD'.
    ls_demo-unit_key     = 'EA'.
    ls_demo-is_active    = 'X'.
    ls_demo-raw_data     = '0000000000000051'.
    ls_demo-num_as_char  = '0000000365'.
    ls_demo-dec_as_char  = '000000051.00'.
    APPEND ls_demo TO lt_demo.

    CLEAR ls_demo.
    ls_demo-client       = sy-mandt.
    ls_demo-id           = '00052'.
    ls_demo-category     = 'DATEFN'.
    ls_demo-region       = 'DEMO'.
    ls_demo-char_field1  = 'DT0002'.
    ls_demo-char_field2  = 'enddate'.
    ls_demo-char_field3  = 'Date Func End         '.
    ls_demo-char_field4  = 'Date-End-002'.
    ls_demo-char_field5  = 'B'.
    ls_demo-numc_field1  = '000052'.
    ls_demo-numc_field2  = '0000000052'.
    ls_demo-lang_field   = 'E'.
    ls_demo-string_field = 'Date function demo: end date 2025-12-31'.
    ls_demo-sstring_field = 'DateFuncEnd'.
    ls_demo-date_field   = '20251231'.   " DAYS_BETWEEN(00051,00052)=364
    ls_demo-time_field   = '235959'.
    CONVERT DATE ls_demo-date_field TIME ls_demo-time_field
            TIME ZONE 'UTC' INTO UTCLONG lv_ts.
    ls_demo-timestamp_field = lv_ts.
    ls_demo-accp_field   = '202512'.
    ls_demo-date_as_char = '20251231'.
    ls_demo-time_as_char = '235959'.
    ls_demo-int1_field   = 52.
    ls_demo-int2_field   = 364.
    ls_demo-int4_field   = 364.
    ls_demo-int8_field   = 364000.
    ls_demo-dec_field    = '052.00'.
    ls_demo-dec_field2   = '005.200'.
    ls_demo-dec_field3   = '052.000000'.
    ls_demo-fltp_field   = '52.0'.
    ls_demo-fltp_field2  = '-52.0'.
    ls_demo-curr_field   = '052.00'.
    ls_demo-quan_field   = '052.000'.
    ls_demo-currency_key = 'EUR'.
    ls_demo-unit_key     = 'EA'.
    ls_demo-is_active    = 'X'.
    ls_demo-raw_data     = '0000000000000052'.
    ls_demo-num_as_char  = '0000000364'.
    ls_demo-dec_as_char  = '000000052.00'.
    APPEND ls_demo TO lt_demo.

    CLEAR ls_demo.
    ls_demo-client       = sy-mandt.
    ls_demo-id           = '00053'.
    ls_demo-category     = 'DATEFN'.
    ls_demo-region       = 'DEMO'.
    ls_demo-char_field1  = 'DT0003'.
    ls_demo-char_field2  = 'invaldate'.
    ls_demo-char_field3  = 'Date Func Invalid     '.
    ls_demo-char_field4  = 'Date-Invalid-003'.
    ls_demo-char_field5  = 'C'.
    ls_demo-numc_field1  = '000053'.
    ls_demo-numc_field2  = '0000000053'.
    ls_demo-lang_field   = 'D'.
    ls_demo-string_field = 'DATS_IS_VALID demo: date=00000000 returns 0'.
    ls_demo-sstring_field = 'DateFuncInvalid'.
    ls_demo-date_field   = '00000000'.   " invalid → DATS_IS_VALID = 0
    ls_demo-time_field   = '000000'.
    ls_demo-timestamp_field = lv_ts.   " reuse a valid ts for this row
    ls_demo-accp_field   = '202501'.
    ls_demo-date_as_char = '00000000'.
    ls_demo-time_as_char = '000000'.
    ls_demo-int1_field   = 53.
    ls_demo-int2_field   = 0.
    ls_demo-int4_field   = 0.
    ls_demo-int8_field   = 0.
    ls_demo-dec_field    = '053.00'.
    ls_demo-dec_field2   = '005.300'.
    ls_demo-dec_field3   = '053.000000'.
    ls_demo-fltp_field   = '53.0'.
    ls_demo-fltp_field2  = '-53.0'.
    ls_demo-curr_field   = '053.00'.
    ls_demo-quan_field   = '053.000'.
    ls_demo-currency_key = 'GBP'.
    ls_demo-unit_key     = 'EA'.
    ls_demo-is_active    = ' '.
    ls_demo-raw_data     = '0000000000000053'.
    ls_demo-num_as_char  = '0000000000'.
    ls_demo-dec_as_char  = '000000053.00'.
    APPEND ls_demo TO lt_demo.

    CLEAR ls_demo.
    ls_demo-client       = sy-mandt.
    ls_demo-id           = '00054'.
    ls_demo-category     = 'DATEFN'.
    ls_demo-region       = 'DEMO'.
    ls_demo-char_field1  = 'DT0004'.
    ls_demo-char_field2  = 'adddays'.
    ls_demo-char_field3  = 'Date Func Add Days    '.
    ls_demo-char_field4  = 'Date-AddDays-004'.
    ls_demo-char_field5  = 'D'.
    ls_demo-numc_field1  = '000054'.
    ls_demo-numc_field2  = '0000000054'.
    ls_demo-lang_field   = 'F'.
    ls_demo-string_field = 'DATS_ADD_DAYS demo: 2025-06-01 + 30 = 2025-07-01'.
    ls_demo-sstring_field = 'DateFuncAddDays'.
    ls_demo-date_field   = '20250601'.   " + int4(30) → 20250701
    ls_demo-time_field   = '120000'.
    CONVERT DATE ls_demo-date_field TIME ls_demo-time_field
            TIME ZONE 'UTC' INTO UTCLONG lv_ts.
    ls_demo-timestamp_field = lv_ts.
    ls_demo-accp_field   = '202506'.
    ls_demo-date_as_char = '20250601'.
    ls_demo-time_as_char = '120000'.
    ls_demo-int1_field   = 54.
    ls_demo-int2_field   = 30.
    ls_demo-int4_field   = 30.      " n days to add
    ls_demo-int8_field   = 30000.
    ls_demo-dec_field    = '054.00'.
    ls_demo-dec_field2   = '005.400'.
    ls_demo-dec_field3   = '054.000000'.
    ls_demo-fltp_field   = '54.0'.
    ls_demo-fltp_field2  = '-54.0'.
    ls_demo-curr_field   = '054.00'.
    ls_demo-quan_field   = '054.000'.
    ls_demo-currency_key = 'INR'.
    ls_demo-unit_key     = 'EA'.
    ls_demo-is_active    = 'X'.
    ls_demo-raw_data     = '0000000000000054'.
    ls_demo-num_as_char  = '0000000030'.
    ls_demo-dec_as_char  = '000000054.00'.
    APPEND ls_demo TO lt_demo.

    CLEAR ls_demo.
    ls_demo-client       = sy-mandt.
    ls_demo-id           = '00055'.
    ls_demo-category     = 'DATEFN'.
    ls_demo-region       = 'DEMO'.
    ls_demo-char_field1  = 'DT0005'.
    ls_demo-char_field2  = 'timestamp'.
    ls_demo-char_field3  = 'Date Func Timestamp   '.
    ls_demo-char_field4  = 'Date-Tstmp-005'.
    ls_demo-char_field5  = 'E'.
    ls_demo-numc_field1  = '000055'.
    ls_demo-numc_field2  = '0000000055'.
    ls_demo-lang_field   = 'J'.
    ls_demo-string_field = 'TSTMP_ADD_SECONDS demo: timestamp + 3600s = +1 hour'.
    ls_demo-sstring_field = 'DateFuncTstmp'.
    ls_demo-date_field   = '20250701'.
    ls_demo-time_field   = '000000'.
    CONVERT DATE ls_demo-date_field TIME ls_demo-time_field
            TIME ZONE 'UTC' INTO UTCLONG lv_ts.
    ls_demo-timestamp_field = lv_ts.
    ls_demo-accp_field   = '202507'.
    ls_demo-date_as_char = '20250701'.
    ls_demo-time_as_char = '000000'.
    ls_demo-int1_field   = 55.
    ls_demo-int2_field   = 3600.
    ls_demo-int4_field   = 3600.    " TSTMP_ADD_SECONDS(ts,3600) → +1 hour
    ls_demo-int8_field   = 3600000.
    ls_demo-dec_field    = '055.00'.
    ls_demo-dec_field2   = '005.500'.
    ls_demo-dec_field3   = '055.000000'.
    ls_demo-fltp_field   = '55.0'.
    ls_demo-fltp_field2  = '-55.0'.
    ls_demo-curr_field   = '055.00'.
    ls_demo-quan_field   = '055.000'.
    ls_demo-currency_key = 'JPY'.
    ls_demo-unit_key     = 'EA'.
    ls_demo-is_active    = 'X'.
    ls_demo-raw_data     = '0000000000000055'.
    ls_demo-num_as_char  = '0000003600'.
    ls_demo-dec_as_char  = '000000055.00'.
    APPEND ls_demo TO lt_demo.

    "==========================================================
    " PERSIST
    "==========================================================
    MODIFY zvkfeb01_dt_demo FROM TABLE @lt_demo.

    IF sy-subrc = 0.
      out->write( |{ lines( lt_demo ) } rows inserted/updated successfully.| ).
      out->write( |Group 00001-00005 : Aggregate functions| ).
      out->write( |Group 00011-00015 : String functions| ).
      out->write( |Group 00021-00025 : Arithmetic expressions| ).
      out->write( |Group 00031-00035 : CAST and type conversion| ).
      out->write( |Group 00041-00045 : CASE / COALESCE / NULLIF| ).
      out->write( |Group 00051-00055 : Date and time functions| ).
    ELSE.
      out->write( |MODIFY failed. SY-SUBRC = { sy-subrc }| ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.

