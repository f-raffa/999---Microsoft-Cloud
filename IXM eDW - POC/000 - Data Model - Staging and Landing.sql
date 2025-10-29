USE edwcore_external;



--External Tables
IF EXISTS ( SELECT *
              FROM INFORMATION_SCHEMA.TABLES
             WHERE TABLE_NAME = 'contracts'
               AND TABLE_SCHEMA = 'aquarius_refined_landing' )
    DROP EXTERNAL DATA SOURCE DefaultLakeDataSource;

CREATE EXTERNAL TABLE aquarius_refined_landing.contracts (
    Row_Hash                       binary(32),
    strGUID                        varchar(25),
    contract_no                    varchar(25),
    precalc_type                   varchar(25),
    frame_id                       varchar(25),
    frame_ship                     varchar(25),
    purchase_sale                  varchar(25),
    contract_type                  varchar(25),
    party_code                     varchar(25),
    brand_code                     varchar(25),
    date_closed                    datetime,
    Evergreen                      float,
    MP_Qty                         float,
    Multi_Qps                      float,
    dry_weight                     float,
    wet_weight                     float,
    moisture_pct                   float,
    weight_unit                    varchar(25),
    tare_weight                    float,
    loaded_wet                     float,
    loaded_dry                     float,
    loaded_moisture                float,
    base_curr                      varchar(25),
    invoice_curr                   varchar(25),
    fx_code                        varchar(25),
    fx_rate                        float,
    phys_status                    varchar(25),
    hedge_status                   varchar(25),
    creation_date                  datetime,
    created_by                     varchar(25),
    contract_date                  datetime,
    weight_dev_pct                 float,
    internal_company               varchar(25),
    Vessel                         varchar(100),
    market_code                    varchar(25),
    ConRef                         varchar(100),
    agency_principle_joint         varchar(25),
    agent_name                     varchar(100),
    long_spot                      varchar(25),
    fiscal_year                    varchar(25),
    accounting_period              varchar(25),
    weight_franchise_pct           float,
    Bill_lading                    datetime,
    BL_number                      varchar(25),
    Shipment_date                  datetime,
    Load_Port                      varchar(25),
    Est_Arr_Load                   datetime,
    Act_Arr_Load                   datetime,
    Est_Dep_Load                   datetime,
    Act_Dep_Load                   datetime,
    Disport                        varchar(25),
    Est_Arr_Disport                datetime,
    Act_Arr_Disport                datetime,
    Est_Dep_Disport                datetime,
    Act_Dep_Disport                datetime,
    Sailing_days                   int,
    Shipping_agent                 varchar(25),
    Charter_Cargo                  varchar(25),
    Ship_long_spot                 varchar(25),
    Surveyor_Load                  varchar(25),
    Surveyor_Disport               varchar(25),
    Country_Code                   varchar(25),
    Sch_Ship_Date                  datetime,
    Lay_Days_Start                 datetime,
    Lay_Days_End                   datetime,
    rail_cars                      float,
    Last_Update                    datetime,
    Last_update_by                 varchar(25),
    Married                        varchar(25),
    Associated                     int,
    delivery_terms                 varchar(25),
    contractual_weight             float,
    contractual_weight_unit        varchar(25),
    discharged_wet                 float,
    discharged_dry                 float,
    discharged_moisture            float,
    hedge_weight                   float,
    freight_parity                 int,
    delivery_start                 datetime,
    delivery_end                   datetime,
    Freight_Weight                 float,
    FCharge_LorD                   varchar(25),
    FAllow_LorD                    varchar(25),
    Est_BLading                    datetime,
    Customs_no                     varchar(100),
    Customs_Date                   datetime,
    Prior_Year_Results             float,
    ProForma_Live                  varchar(25),
    Default_DPs                    int,
    Hdg_dry_weight                 float,
    Hdg_wet_weight                 float,
    Hdg_Moisture                   float,
    Hdg_franchise                  float,
    Inv_dry_weight                 float,
    Inv_wet_weight                 float,
    Inv_Moisture                   float,
    Inv_franchise                  float,
    Membership                     int,
    Mem2                           int,
    Mem3                           int,
    Blending                       int,
    Mem5                           int,
    Assigned_User                  varchar(25),
    Finalised_Status               varchar(25),
    Deal_No                        varchar(25),
    Auto_Comp                      varchar(25),
    Auto_Seq                       varchar(25),
    DeptGUID                       varchar(36),
    FinanceBank_Code               varchar(25),
    FinanceBank_Ref                varchar(25),
    DisableShippingAutoCopy        int,
    strShortCode                   varchar(25),
    NegativeDev                    float,
    MinWeight                      float,
    MaxWeight                      float,
    Options                        varchar(25),
    OptDecDate                     datetime,
    SubShipFrame                   varchar(25),
    Excluded                       varchar(25),
    Finance_Dep                    float,
    Finance_Pct                    int,
    Finance_Amt                    float,
    Finance_Unsold                 float,
    Finance_Open                   varchar(25),
    Finance_Line                   int,
    Finance_Remarks                varchar(100),
    Finance_Against                varchar(25),
    Trader                         varchar(25),
    LoadingDays                    int,
    DischargeDays                  int,
    ShipDaysOverride               varchar(25),
    LaytimeCalcs                   varchar(25),
    Married_2                      varchar(25),
    LCLocation                     varchar(25),
    Confirmed                      varchar(25),
    Orig_strguid                   varchar(25),
    Exposure_Type                  varchar(25),
    In_Use                         int,
    Tripartite_Broker              int,
    In_Use_By                      varchar(25),
    Contract_Type2                 varchar(25),
    Schd_Arrival_Load              datetime,
    Origin                         varchar(100),
    Packing                        varchar(100),
    Risk_Status                    int,
    Actual_Risk_Date               datetime,
    PL_Centre                      varchar(25),
    Est_ContMADP                   datetime,
    Act_ContMADP                   datetime,
    voyage_number                  varchar(25),
    Carrier                        varchar(25),
    FinInvPresentation             datetime,
    MetAvailabliity                datetime,
    ProvPermitNo                   varchar(25),
    FinalPermitNo                  varchar(25),
    HoldingCertificate             datetime,
    CashFLowRevalReqd              int,
    MOA                            datetime,
    MAAInvDate                     datetime,
    QuotaMonth                     datetime,
    WeightUnitAlias                varchar(25),
    ContractDuration               varchar(25),
    MasterContractName             varchar(100),
    BCShippingLinesID              varchar(25),
    Volume                         float,
    Density                        float,
    SplitsAssayUpdate              varchar(100),
    IsMasterContractEditable       bit,
    DraftWMT                       float,
    DraftDMT                       float,
    DraftH2O                       float,
    StockLocation                  varchar(25),
    Stock_EA                       datetime,
    Stock_AA                       datetime,
    Stock_ED                       datetime,
    Stock_AD                       datetime,
    InStock                        int,
    LockOut                        int,
    IsLotbyLotInvoicingEnabled     bit,
    InvoiceVAT                     bit,
    smelter_code                   varchar(25),
    stage_code                     varchar(25),
    PCFX_Code                      varchar(25),
    PCFX_Rate                      float,
    IsPCFXRateOverrided            bit,
    HoldingCertificateReference    varchar(100),
    Received_Weight                float,
    Include_Invoice                varchar(25),
    SWCNumber                      varchar(100),
    IsFromExact                    bit,
    DomesticTransportMode          varchar(25),
    ForeignTransportMode           varchar(25),
    ReceiptDocumentNumber          varchar(25),
    IsFromSAP                      bit,
    IsFakeContract                 bit,
    ShortCodeFlag                  int,
    FixedFXRateConDetails          bit,
    In_Use_By_Form                 varchar(100),
    Split_From                     varchar(25),
    Inherit_Assay_From             varchar(25),
    PaymentCode                    varchar(25),
    BackToBack                     bit,
    MaterialAdverseChange          bit,
    Margining                      bit,
    SYS_CHANGE_OPERATION           char(1),
    extractedAt                    datetime
)
  WITH (
    LOCATION = 'aquarius_refined_staging.db/contracts/',
    DATA_SOURCE = DefaultLakeDataSource,
    FILE_FORMAT = ParquetFileFormat
);



--External Tables
IF EXISTS ( SELECT *
              FROM INFORMATION_SCHEMA.TABLES
             WHERE TABLE_NAME = 'contracts'
               AND TABLE_SCHEMA = 'aquarius_refined_staging' )
    DROP EXTERNAL DATA SOURCE DefaultLakeDataSource;

CREATE EXTERNAL TABLE aquarius_refined_staging.contracts (
    Row_Hash                       binary(32),
    strGUID                        varchar(25),
    contract_no                    varchar(25),
    precalc_type                   varchar(25),
    frame_id                       varchar(25),
    frame_ship                     varchar(25),
    purchase_sale                  varchar(25),
    contract_type                  varchar(25),
    party_code                     varchar(25),
    brand_code                     varchar(25),
    date_closed                    datetime,
    Evergreen                      float,
    MP_Qty                         float,
    Multi_Qps                      float,
    dry_weight                     float,
    wet_weight                     float,
    moisture_pct                   float,
    weight_unit                    varchar(25),
    tare_weight                    float,
    loaded_wet                     float,
    loaded_dry                     float,
    loaded_moisture                float,
    base_curr                      varchar(25),
    invoice_curr                   varchar(25),
    fx_code                        varchar(25),
    fx_rate                        float,
    phys_status                    varchar(25),
    hedge_status                   varchar(25),
    creation_date                  datetime,
    created_by                     varchar(25),
    contract_date                  datetime,
    weight_dev_pct                 float,
    internal_company               varchar(25),
    Vessel                         varchar(100),
    market_code                    varchar(25),
    ConRef                         varchar(100),
    agency_principle_joint         varchar(25),
    agent_name                     varchar(100),
    long_spot                      varchar(25),
    fiscal_year                    varchar(25),
    accounting_period              varchar(25),
    weight_franchise_pct           float,
    Bill_lading                    datetime,
    BL_number                      varchar(25),
    Shipment_date                  datetime,
    Load_Port                      varchar(25),
    Est_Arr_Load                   datetime,
    Act_Arr_Load                   datetime,
    Est_Dep_Load                   datetime,
    Act_Dep_Load                   datetime,
    Disport                        varchar(25),
    Est_Arr_Disport                datetime,
    Act_Arr_Disport                datetime,
    Est_Dep_Disport                datetime,
    Act_Dep_Disport                datetime,
    Sailing_days                   int,
    Shipping_agent                 varchar(25),
    Charter_Cargo                  varchar(25),
    Ship_long_spot                 varchar(25),
    Surveyor_Load                  varchar(25),
    Surveyor_Disport               varchar(25),
    Country_Code                   varchar(25),
    Sch_Ship_Date                  datetime,
    Lay_Days_Start                 datetime,
    Lay_Days_End                   datetime,
    rail_cars                      float,
    Last_Update                    datetime,
    Last_update_by                 varchar(25),
    Married                        varchar(25),
    Associated                     int,
    delivery_terms                 varchar(25),
    contractual_weight             float,
    contractual_weight_unit        varchar(25),
    discharged_wet                 float,
    discharged_dry                 float,
    discharged_moisture            float,
    hedge_weight                   float,
    freight_parity                 int,
    delivery_start                 datetime,
    delivery_end                   datetime,
    Freight_Weight                 float,
    FCharge_LorD                   varchar(25),
    FAllow_LorD                    varchar(25),
    Est_BLading                    datetime,
    Customs_no                     varchar(100),
    Customs_Date                   datetime,
    Prior_Year_Results             float,
    ProForma_Live                  varchar(25),
    Default_DPs                    int,
    Hdg_dry_weight                 float,
    Hdg_wet_weight                 float,
    Hdg_Moisture                   float,
    Hdg_franchise                  float,
    Inv_dry_weight                 float,
    Inv_wet_weight                 float,
    Inv_Moisture                   float,
    Inv_franchise                  float,
    Membership                     int,
    Mem2                           int,
    Mem3                           int,
    Blending                       int,
    Mem5                           int,
    Assigned_User                  varchar(25),
    Finalised_Status               varchar(25),
    Deal_No                        varchar(25),
    Auto_Comp                      varchar(25),
    Auto_Seq                       varchar(25),
    DeptGUID                       varchar(36),
    FinanceBank_Code               varchar(25),
    FinanceBank_Ref                varchar(25),
    DisableShippingAutoCopy        int,
    strShortCode                   varchar(25),
    NegativeDev                    float,
    MinWeight                      float,
    MaxWeight                      float,
    Options                        varchar(25),
    OptDecDate                     datetime,
    SubShipFrame                   varchar(25),
    Excluded                       varchar(25),
    Finance_Dep                    float,
    Finance_Pct                    int,
    Finance_Amt                    float,
    Finance_Unsold                 float,
    Finance_Open                   varchar(25),
    Finance_Line                   int,
    Finance_Remarks                varchar(100),
    Finance_Against                varchar(25),
    Trader                         varchar(25),
    LoadingDays                    int,
    DischargeDays                  int,
    ShipDaysOverride               varchar(25),
    LaytimeCalcs                   varchar(25),
    Married_2                      varchar(25),
    LCLocation                     varchar(25),
    Confirmed                      varchar(25),
    Orig_strguid                   varchar(25),
    Exposure_Type                  varchar(25),
    In_Use                         int,
    Tripartite_Broker              int,
    In_Use_By                      varchar(25),
    Contract_Type2                 varchar(25),
    Schd_Arrival_Load              datetime,
    Origin                         varchar(100),
    Packing                        varchar(100),
    Risk_Status                    int,
    Actual_Risk_Date               datetime,
    PL_Centre                      varchar(25),
    Est_ContMADP                   datetime,
    Act_ContMADP                   datetime,
    voyage_number                  varchar(25),
    Carrier                        varchar(25),
    FinInvPresentation             datetime,
    MetAvailabliity                datetime,
    ProvPermitNo                   varchar(25),
    FinalPermitNo                  varchar(25),
    HoldingCertificate             datetime,
    CashFLowRevalReqd              int,
    MOA                            datetime,
    MAAInvDate                     datetime,
    QuotaMonth                     datetime,
    WeightUnitAlias                varchar(25),
    ContractDuration               varchar(25),
    MasterContractName             varchar(100),
    BCShippingLinesID              varchar(25),
    Volume                         float,
    Density                        float,
    SplitsAssayUpdate              varchar(100),
    IsMasterContractEditable       bit,
    DraftWMT                       float,
    DraftDMT                       float,
    DraftH2O                       float,
    StockLocation                  varchar(25),
    Stock_EA                       datetime,
    Stock_AA                       datetime,
    Stock_ED                       datetime,
    Stock_AD                       datetime,
    InStock                        int,
    LockOut                        int,
    IsLotbyLotInvoicingEnabled     bit,
    InvoiceVAT                     bit,
    smelter_code                   varchar(25),
    stage_code                     varchar(25),
    PCFX_Code                      varchar(25),
    PCFX_Rate                      float,
    IsPCFXRateOverrided            bit,
    HoldingCertificateReference    varchar(100),
    Received_Weight                float,
    Include_Invoice                varchar(25),
    SWCNumber                      varchar(100),
    IsFromExact                    bit,
    DomesticTransportMode          varchar(25),
    ForeignTransportMode           varchar(25),
    ReceiptDocumentNumber          varchar(25),
    IsFromSAP                      bit,
    IsFakeContract                 bit,
    ShortCodeFlag                  int,
    FixedFXRateConDetails          bit,
    In_Use_By_Form                 varchar(100),
    Split_From                     varchar(25),
    Inherit_Assay_From             varchar(25),
    PaymentCode                    varchar(25),
    BackToBack                     bit,
    MaterialAdverseChange          bit,
    Margining                      bit,
    SYS_CHANGE_OPERATION           char(1),
    minimumExtractedAt             datetime
)
  WITH (
    LOCATION = 'aquarius_refined_staging.db/contracts/',
    DATA_SOURCE = DefaultLakeDataSource,
    FILE_FORMAT = ParquetFileFormat
);




--External Tables
IF EXISTS ( SELECT *
              FROM INFORMATION_SCHEMA.TABLES
             WHERE TABLE_NAME = 'brands'
               AND TABLE_SCHEMA = 'aquarius_refined_landing' )
    DROP EXTERNAL DATA SOURCE DefaultLakeDataSource;

CREATE EXTERNAL TABLE aquarius_refined_landing.brands (
    Row_Hash                       binary(32),
    strGUID                        varchar(25),
    Brand_Code                     varchar(25),
    Description                    varchar(max),
    Metal_code                     varchar(25),
    Commodity_code                 varchar(25),
    Country_code                   varchar(25),
    Translation                    varchar(100),
    Grade                          varchar(25),
    Brand_No                       varchar(25),
    DistrictID                     int,
    RowReadOnly                    bit,
    SYS_CHANGE_OPERATION           char(1),
    extractedAt                    datetime
)
  WITH (
    LOCATION = 'aquarius_refined_staging.db/brands/',
    DATA_SOURCE = DefaultLakeDataSource,
    FILE_FORMAT = ParquetFileFormat
);


--External Tables
IF EXISTS ( SELECT *
              FROM INFORMATION_SCHEMA.TABLES
             WHERE TABLE_NAME = 'brands'
               AND TABLE_SCHEMA = 'aquarius_refined_staging' )
    DROP EXTERNAL DATA SOURCE DefaultLakeDataSource;

CREATE EXTERNAL TABLE aquarius_refined_staging.brands (
    Row_Hash                       binary(32),
    strGUID                        varchar(25),
    Brand_Code                     varchar(25),
    Description                    varchar(max),
    Metal_code                     varchar(25),
    Commodity_code                 varchar(25),
    Country_code                   varchar(25),
    Translation                    varchar(100),
    Grade                          varchar(25),
    Brand_No                       varchar(25),
    DistrictID                     int,
    RowReadOnly                    bit,
    SYS_CHANGE_OPERATION           char(1),
    extractedAt                    datetime
)
  WITH (
    LOCATION = 'aquarius_refined_staging.db/brands/',
    DATA_SOURCE = DefaultLakeDataSource,
    FILE_FORMAT = ParquetFileFormat
);




--External Tables
IF EXISTS ( SELECT *
              FROM INFORMATION_SCHEMA.TABLES
             WHERE TABLE_NAME = 'companies'
               AND TABLE_SCHEMA = 'aquarius_refined_landing' )
    DROP EXTERNAL DATA SOURCE DefaultLakeDataSource;

CREATE EXTERNAL TABLE aquarius_refined_landing.companies (
    Row_Hash                       binary(32),
    strGUID                        varchar(25),
    Company_Code                   varchar(25),
    Description                    varchar(100),
    BPD_Code                       varchar(25),
    short_code                     varchar(25),
    Num_code                       varchar(25),
    VAT_Number                     varchar(25),
    Street                         varchar(100),
    Province                       varchar(100),
    City                           varchar(100),
    Telephone                      varchar(100),
    FaxNumber                      varchar(100),
    Country                        varchar(25),
    EconomicActivity               varchar(100),
    EconomicActivityCode           int,
    DistrictCode                   varchar(25),
    AccountSiteCode                varchar(25),
    AxCompanyCode                  varchar(25),
    SYS_CHANGE_OPERATION           char(1),
    extractedAt                    datetime
)
  WITH (
    LOCATION = 'aquarius_refined_staging.db/companies/',
    DATA_SOURCE = DefaultLakeDataSource,
    FILE_FORMAT = ParquetFileFormat
);


--External Tables
IF EXISTS ( SELECT *
              FROM INFORMATION_SCHEMA.TABLES
             WHERE TABLE_NAME = 'companies'
               AND TABLE_SCHEMA = 'aquarius_refined_staging' )
    DROP EXTERNAL DATA SOURCE DefaultLakeDataSource;

CREATE EXTERNAL TABLE aquarius_refined_staging.companies (
    Row_Hash                       binary(32),
    strGUID                        varchar(25),
    Company_Code                   varchar(25),
    Description                    varchar(100),
    BPD_Code                       varchar(25),
    short_code                     varchar(25),
    Num_code                       varchar(25),
    VAT_Number                     varchar(25),
    Street                         varchar(100),
    Province                       varchar(100),
    City                           varchar(100),
    Telephone                      varchar(100),
    FaxNumber                      varchar(100),
    Country                        varchar(25),
    EconomicActivity               varchar(100),
    EconomicActivityCode           int,
    DistrictCode                   varchar(25),
    AccountSiteCode                varchar(25),
    AxCompanyCode                  varchar(25),
    SYS_CHANGE_OPERATION           char(1),
    extractedAt                    datetime
)
  WITH (
    LOCATION = 'aquarius_refined_staging.db/companies/',
    DATA_SOURCE = DefaultLakeDataSource,
    FILE_FORMAT = ParquetFileFormat
);
	
	
	


--External Tables
IF EXISTS ( SELECT *
              FROM INFORMATION_SCHEMA.TABLES
             WHERE TABLE_NAME = 'parties'
               AND TABLE_SCHEMA = 'aquarius_refined_landing' )
    DROP EXTERNAL DATA SOURCE DefaultLakeDataSource;

CREATE EXTERNAL TABLE aquarius_refined_landing.parties (
    Row_Hash                       binary(32),
    Party_ID                       varchar(25),
    party_code                     varchar(25),
    description                    varchar(100),
    country                        varchar(25),
    c_add_1                        varchar(100),
    c_add_2                        varchar(100),
    c_add_3                        varchar(100),
    c_add_4                        varchar(100),
    telephone                      varchar(100),
    fax_number                     varchar(100),
    E_Mail                         varchar(100),
    contract_limit                 float,
    credit_limit                   float,
    credit_limit_date              datetime,
    EEC_VAT_invoice                varchar(25),
    VAT_number                     varchar(100),
    group_code                     varchar(25),
    party_type                     varchar(25),
    Inv_add_1                      varchar(100),
    Inv_add_2                      varchar(100),
    Inv_add_3                      varchar(100),
    Inv_add_4                      varchar(100),
    Customer_no                    varchar(25),
    Ledger_Code                    varchar(25),
    Allow_Trade_Entry              varchar(25),
    Internal_Company               varchar(25),
    Redundant                      int,
    Inv_2_add_1                    varchar(100),
    Inv_2_add_2                    varchar(100),
    Inv_2_add_3                    varchar(100),
    Inv_2_add_4                    varchar(100),
    Inv_3_add_1                    varchar(100),
    Inv_3_add_2                    varchar(100),
    Inv_3_add_3                    varchar(100),
    Inv_3_add_4                    varchar(100),
    EconomicActivity               varchar(100),
    EconomicActivityCode           int,
    VAT_number02                   varchar(100),
    VAT_number03                   varchar(100),
    AxPartyCode                    varchar(100),
    RowReadOnly                    bit,
    BankCode                       varchar(25),
    SYS_CHANGE_OPERATION           char(1),
    extractedAt                    datetime
)
  WITH (
    LOCATION = 'aquarius_refined_staging.db/parties/',
    DATA_SOURCE = DefaultLakeDataSource,
    FILE_FORMAT = ParquetFileFormat
);


--External Tables
IF EXISTS ( SELECT *
              FROM INFORMATION_SCHEMA.TABLES
             WHERE TABLE_NAME = 'parties'
               AND TABLE_SCHEMA = 'aquarius_refined_staging' )
    DROP EXTERNAL DATA SOURCE DefaultLakeDataSource;

CREATE EXTERNAL TABLE aquarius_refined_staging.parties (
    Row_Hash                       binary(32),
    Party_ID                       varchar(25),
    party_code                     varchar(25),
    description                    varchar(100),
    country                        varchar(25),
    c_add_1                        varchar(100),
    c_add_2                        varchar(100),
    c_add_3                        varchar(100),
    c_add_4                        varchar(100),
    telephone                      varchar(100),
    fax_number                     varchar(100),
    E_Mail                         varchar(100),
    contract_limit                 float,
    credit_limit                   float,
    credit_limit_date              datetime,
    EEC_VAT_invoice                varchar(25),
    VAT_number                     varchar(100),
    group_code                     varchar(25),
    party_type                     varchar(25),
    Inv_add_1                      varchar(100),
    Inv_add_2                      varchar(100),
    Inv_add_3                      varchar(100),
    Inv_add_4                      varchar(100),
    Customer_no                    varchar(25),
    Ledger_Code                    varchar(25),
    Allow_Trade_Entry              varchar(25),
    Internal_Company               varchar(25),
    Redundant                      int,
    Inv_2_add_1                    varchar(100),
    Inv_2_add_2                    varchar(100),
    Inv_2_add_3                    varchar(100),
    Inv_2_add_4                    varchar(100),
    Inv_3_add_1                    varchar(100),
    Inv_3_add_2                    varchar(100),
    Inv_3_add_3                    varchar(100),
    Inv_3_add_4                    varchar(100),
    EconomicActivity               varchar(100),
    EconomicActivityCode           int,
    VAT_number02                   varchar(100),
    VAT_number03                   varchar(100),
    AxPartyCode                    varchar(100),
    RowReadOnly                    bit,
    BankCode                       varchar(25),
    SYS_CHANGE_OPERATION           char(1),
    extractedAt                    datetime
)
  WITH (
    LOCATION = 'aquarius_refined_staging.db/parties/',
    DATA_SOURCE = DefaultLakeDataSource,
    FILE_FORMAT = ParquetFileFormat
);





--External Tables
IF EXISTS ( SELECT *
              FROM INFORMATION_SCHEMA.TABLES
             WHERE TABLE_NAME = 'traders'
               AND TABLE_SCHEMA = 'aquarius_refined_landing' )
    DROP EXTERNAL DATA SOURCE DefaultLakeDataSource;

CREATE EXTERNAL TABLE aquarius_refined_landing.traders (
    Row_Hash                       binary(32),
    AutoID                         uniqueidentifier,
    Trader                         varchar(25),
    TraderName                     varchar(100),
    Closed                         varchar(25),
    SYS_CHANGE_OPERATION           char(1),
    extractedAt                    datetime
)
  WITH (
    LOCATION = 'aquarius_refined_staging.db/traders/',
    DATA_SOURCE = DefaultLakeDataSource,
    FILE_FORMAT = ParquetFileFormat
);


--External Tables
IF EXISTS ( SELECT *
              FROM INFORMATION_SCHEMA.TABLES
             WHERE TABLE_NAME = 'traders'
               AND TABLE_SCHEMA = 'aquarius_refined_staging' )
    DROP EXTERNAL DATA SOURCE DefaultLakeDataSource;

CREATE EXTERNAL TABLE aquarius_refined_staging.traders (
    Row_Hash                       binary(32),
    AutoID                         uniqueidentifier,
    Trader                         varchar(25),
    TraderName                     varchar(100),
    Closed                         varchar(25),
    SYS_CHANGE_OPERATION           char(1),
    extractedAt                    datetime
)
  WITH (
    LOCATION = 'aquarius_refined_staging.db/traders/',
    DATA_SOURCE = DefaultLakeDataSource,
    FILE_FORMAT = ParquetFileFormat
);





--External Tables
IF EXISTS ( SELECT *
              FROM INFORMATION_SCHEMA.TABLES
             WHERE TABLE_NAME = 'users'
               AND TABLE_SCHEMA = 'aquarius_refined_landing' )
    DROP EXTERNAL DATA SOURCE DefaultLakeDataSource;

CREATE EXTERNAL TABLE aquarius_refined_landing.users (
    Row_Hash                       binary(32),
    UserID                         varchar(25),
    Username                       varchar(25),
    Description                    varchar(100),
    GPreAm                         varchar(25),
    NextGUID                       varchar(25),
    EOD_EOM                        varchar(25),
    AutoPL                         varchar(25),
    Closed                         varchar(25),
    D_Cascade                      varchar(25),
    AutoQPDates                    varchar(25),
    QPAdjust                       varchar(25),
    AllShipments                   varchar(25),
    UpdateAllShips                 varchar(25),
    AutoPayTerms                   varchar(25),
    FinAssayAdjust                 varchar(25),
    OverrideIncPrevInvControl      varchar(25),
    SYS_CHANGE_OPERATION           char(1),
    extractedAt                    datetime
)
  WITH (
    LOCATION = 'aquarius_refined_staging.db/users/',
    DATA_SOURCE = DefaultLakeDataSource,
    FILE_FORMAT = ParquetFileFormat
);


--External Tables
IF EXISTS ( SELECT *
              FROM INFORMATION_SCHEMA.TABLES
             WHERE TABLE_NAME = 'users'
               AND TABLE_SCHEMA = 'aquarius_refined_staging' )
    DROP EXTERNAL DATA SOURCE DefaultLakeDataSource;

CREATE EXTERNAL TABLE aquarius_refined_staging.users (
    Row_Hash                       binary(32),
    UserID                         varchar(25),
    Username                       varchar(25),
    Description                    varchar(100),
    GPreAm                         varchar(25),
    NextGUID                       varchar(25),
    EOD_EOM                        varchar(25),
    AutoPL                         varchar(25),
    Closed                         varchar(25),
    D_Cascade                      varchar(25),
    AutoQPDates                    varchar(25),
    QPAdjust                       varchar(25),
    AllShipments                   varchar(25),
    UpdateAllShips                 varchar(25),
    AutoPayTerms                   varchar(25),
    FinAssayAdjust                 varchar(25),
    OverrideIncPrevInvControl      varchar(25),
    SYS_CHANGE_OPERATION           char(1),
    extractedAt                    datetime
)
  WITH (
    LOCATION = 'aquarius_refined_staging.db/users/',
    DATA_SOURCE = DefaultLakeDataSource,
    FILE_FORMAT = ParquetFileFormat
);





--External Tables
IF EXISTS ( SELECT *
              FROM INFORMATION_SCHEMA.TABLES
             WHERE TABLE_NAME = 'countries'
               AND TABLE_SCHEMA = 'aquarius_refined_landing' )
    DROP EXTERNAL DATA SOURCE DefaultLakeDataSource;

CREATE EXTERNAL TABLE aquarius_refined_landing.countries (
    Row_Hash                       binary(32),
    strGUID                        varchar(25),
    Country_Code                   varchar(25),
    Description                    varchar(max),
    Accounting_code                varchar(100),
    Area_Code                      varchar(25),
    CustomsCode                    varchar(25),
    SYS_CHANGE_OPERATION           char(1),
    extractedAt                    datetime
)
  WITH (
    LOCATION = 'aquarius_refined_staging.db/countries/',
    DATA_SOURCE = DefaultLakeDataSource,
    FILE_FORMAT = ParquetFileFormat
);


--External Tables
IF EXISTS ( SELECT *
              FROM INFORMATION_SCHEMA.TABLES
             WHERE TABLE_NAME = 'countries'
               AND TABLE_SCHEMA = 'aquarius_refined_staging' )
    DROP EXTERNAL DATA SOURCE DefaultLakeDataSource;

CREATE EXTERNAL TABLE aquarius_refined_staging.countries (
    Row_Hash                       binary(32),
    strGUID                        varchar(25),
    Country_Code                   varchar(25),
    Description                    varchar(max),
    Accounting_code                varchar(100),
    Area_Code                      varchar(25),
    CustomsCode                    varchar(25),
    SYS_CHANGE_OPERATION           char(1),
    extractedAt                    datetime
)
  WITH (
    LOCATION = 'aquarius_refined_staging.db/countries/',
    DATA_SOURCE = DefaultLakeDataSource,
    FILE_FORMAT = ParquetFileFormat
);





--External Tables
IF EXISTS ( SELECT *
              FROM INFORMATION_SCHEMA.TABLES
             WHERE TABLE_NAME = 'ports'
               AND TABLE_SCHEMA = 'aquarius_refined_landing' )
    DROP EXTERNAL DATA SOURCE DefaultLakeDataSource;

CREATE EXTERNAL TABLE aquarius_refined_landing.ports (
    Row_Hash                       binary(32),
    strGUID                        varchar(25),
    Location_code                  varchar(25),
    Description                    varchar(100),
    Location_type                  varchar(25),
    Country_Code                   varchar(25),
    CustomsCode                    int,
    SYS_CHANGE_OPERATION           char(1),
    extractedAt                    datetime
)
  WITH (
    LOCATION = 'aquarius_refined_staging.db/ports/',
    DATA_SOURCE = DefaultLakeDataSource,
    FILE_FORMAT = ParquetFileFormat
);


--External Tables
IF EXISTS ( SELECT *
              FROM INFORMATION_SCHEMA.TABLES
             WHERE TABLE_NAME = 'ports'
               AND TABLE_SCHEMA = 'aquarius_refined_staging' )
    DROP EXTERNAL DATA SOURCE DefaultLakeDataSource;

CREATE EXTERNAL TABLE aquarius_refined_staging.ports (
    Row_Hash                       binary(32),
    strGUID                        varchar(25),
    Location_code                  varchar(25),
    Description                    varchar(100),
    Location_type                  varchar(25),
    Country_Code                   varchar(25),
    CustomsCode                    int,
    SYS_CHANGE_OPERATION           char(1),
    extractedAt                    datetime
)
  WITH (
    LOCATION = 'aquarius_refined_staging.db/ports/',
    DATA_SOURCE = DefaultLakeDataSource,
    FILE_FORMAT = ParquetFileFormat
);




--External Tables
IF EXISTS ( SELECT *
              FROM INFORMATION_SCHEMA.TABLES
             WHERE TABLE_NAME = 'users'
               AND TABLE_SCHEMA = 'aquarius_ldcustom_landing' )
    DROP EXTERNAL DATA SOURCE DefaultLakeDataSource;

CREATE EXTERNAL TABLE aquarius_ldcustom_landing.users (
    Row_Hash                       binary(32),
    application                    varchar(25),
    username                       varchar(25),
    region                         varchar(25),
    office                         varchar(25),
    department                     varchar(25),
    email                          varchar(50),
    SYS_CHANGE_OPERATION           char(1),
    extractedAt                    datetime
)
  WITH (
    LOCATION = 'aquarius_ldcustom_staging.db/users/',
    DATA_SOURCE = DefaultLakeDataSource,
    FILE_FORMAT = ParquetFileFormat
);


--External Tables
IF EXISTS ( SELECT *
              FROM INFORMATION_SCHEMA.TABLES
             WHERE TABLE_NAME = 'users'
               AND TABLE_SCHEMA = 'aquarius_ldcustom_staging' )
    DROP EXTERNAL DATA SOURCE DefaultLakeDataSource;

CREATE EXTERNAL TABLE aquarius_ldcustom_staging.users (
    Row_Hash                       binary(32),
    application                    varchar(25),
    username                       varchar(25),
    region                         varchar(25),
    office                         varchar(25),
    department                     varchar(25),
    email                          varchar(50),
    SYS_CHANGE_OPERATION           char(1),
    extractedAt                    datetime
)
  WITH (
    LOCATION = 'aquarius_ldcustom_staging.db/users/',
    DATA_SOURCE = DefaultLakeDataSource,
    FILE_FORMAT = ParquetFileFormat
);