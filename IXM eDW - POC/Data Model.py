RawVault.AQ_R_Brands_S
    StructField("strGUID", StringType()),
    StructField("Brand_Code", StringType()),
    StructField("Description", StringType()),
    StructField("Metal_code", StringType()),
    StructField("Commodity_code", StringType()),
    StructField("Country_code", StringType()),
    StructField("Translation", StringType()),
    StructField("Grade", StringType()),
    StructField("Brand_No", StringType()),
    StructField("DistrictID", IntegerType()),
    StructField("RowReadOnly", BooleanType()),
    StructField("SYS_CHANGE_OPERATION", StringType()),
    StructField("extractedAt", TimestampType())




RawVault.AQ_R_Companies_S
    StructField("strGUID", StringType()),
    StructField("Company_Code", StringType()),
    StructField("Description", StringType()),
    StructField("BPD_Code", StringType()),
    StructField("short_code", StringType()),
    StructField("Num_code", StringType()),
    StructField("VAT_Number", StringType()),
    StructField("Street", StringType()),
    StructField("Province", StringType()),
    StructField("City", StringType()),
    StructField("Telephone", StringType()),
    StructField("FaxNumber", StringType()),
    StructField("Country", StringType()),
    StructField("EconomicActivity", StringType()),
    StructField("EconomicActivityCode", IntegerType()),
    StructField("DistrictCode", StringType()),
    StructField("AccountSiteCode", StringType()),
    StructField("AxCompanyCode", StringType()),
    StructField("SYS_CHANGE_OPERATION", StringType()),
    StructField("extractedAt", TimestampType())




RawVault.AQ_R_Contract_Parties_S
    StructField("Party_ID", StringType()),
    StructField("party_code", StringType()),
    StructField("description", StringType()),
    StructField("country", StringType()),
    StructField("c_add_1", StringType()),
    StructField("c_add_2", StringType()),
    StructField("c_add_3", StringType()),
    StructField("c_add_4", StringType()),
    StructField("telephone", StringType()),
    StructField("fax_number", StringType()),
    StructField("E_Mail", StringType()),
    StructField("contract_limit", FloatType()),
    StructField("credit_limit", FloatType()),
    StructField("credit_limit_date", TimestampType()),
    StructField("EEC_VAT_invoice", StringType()),
    StructField("VAT_number", StringType()),
    StructField("group_code", StringType()),
    StructField("party_type", StringType()),
    StructField("Inv_add_1", StringType()),
    StructField("Inv_add_2", StringType()),
    StructField("Inv_add_3", StringType()),
    StructField("Inv_add_4", StringType()),
    StructField("Customer_no", StringType()),
    StructField("Ledger_Code", StringType()),
    StructField("Allow_Trade_Entry", StringType()),
    StructField("Internal_Company", StringType()),
    StructField("Redundant", IntegerType()),
    StructField("Inv_2_add_1", StringType()),
    StructField("Inv_2_add_2", StringType()),
    StructField("Inv_2_add_3", StringType()),
    StructField("Inv_2_add_4", StringType()),
    StructField("Inv_3_add_1", StringType()),
    StructField("Inv_3_add_2", StringType()),
    StructField("Inv_3_add_3", StringType()),
    StructField("Inv_3_add_4", StringType()),
    StructField("EconomicActivity", StringType()),
    StructField("EconomicActivityCode", IntegerType()),
    StructField("VAT_number02", StringType()),
    StructField("VAT_number03", StringType()),
    StructField("AxPartyCode", StringType()),
    StructField("RowReadOnly", BooleanType()),
    StructField("BankCode", StringType()),
    StructField("SYS_CHANGE_OPERATION", StringType()),
    StructField("extractedAt", TimestampType())




RawVault.AQ_R_Traders_S
    StructField("AutoID", StringType()),
    StructField("Trader", StringType()),
    StructField("TraderName", StringType()),
    StructField("Closed", StringType()),
    StructField("SYS_CHANGE_OPERATION", StringType()),
    StructField("extractedAt", TimestampType())




RawVault.AQ_R_Users_S
    StructField("UserID", StringType()),
    StructField("Username", StringType()),
    StructField("Description", StringType()),
    StructField("GPreAm", StringType()),
    StructField("NextGUID", StringType()),
    StructField("EOD_EOM", StringType()),
    StructField("AutoPL", StringType()),
    StructField("Closed", StringType()),
    StructField("D_Cascade", StringType()),
    StructField("AutoQPDates", StringType()),
    StructField("QPAdjust", StringType()),
    StructField("AllShipments", StringType()),
    StructField("UpdateAllShips", StringType()),
    StructField("AutoPayTerms", StringType()),
    StructField("FinAssayAdjust", StringType()),
    StructField("OverrideIncPrevInvControl", StringType()),
    StructField("SYS_CHANGE_OPERATION", StringType()),
    StructField("extractedAt", TimestampType())




RawVault.AQ_LDCUSTOM_Users_Region_S
    StructField("application", StringType()),
    StructField("username", StringType()),
    StructField("region", StringType()),
    StructField("office", StringType()),
    StructField("department", StringType()),
    StructField("email", StringType()),
    StructField("SYS_CHANGE_OPERATION", StringType()),
    StructField("extractedAt", TimestampType())




RawVault.AQ_R_Countries_S
    StructField("strGUID", StringType()),
    StructField("Country_Code", StringType()),
    StructField("Description", StringType()),
    StructField("Accounting_code", StringType()),
    StructField("Area_Code", StringType()),
    StructField("CustomsCode", StringType()),
    StructField("SYS_CHANGE_OPERATION", StringType()),
    StructField("extractedAt", TimestampType())


RawVault.AQ_R_Ports_S
    StructField("strGUID", StringType()),
    StructField("Location_code", StringType()),
    StructField("Description", StringType()),
    StructField("Location_type", StringType()),
    StructField("Country_Code", StringType()),
    StructField("CustomsCode", IntegerType()),
    StructField("SYS_CHANGE_OPERATION", StringType()),
    StructField("extractedAt", TimestampType())