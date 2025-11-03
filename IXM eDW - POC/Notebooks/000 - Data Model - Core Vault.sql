DROP TABLE IF EXISTS core_vault.h_users;
CREATE TABLE core_vault.h_users (
    Hub_Hash_Key                   bigint,
    username                       varchar(25),
    Creation_Timestamp             timestamp
)
USING DELTA
LOCATION 'abfss://010-core@synapsewarehousestorage.dfs.core.windows.net/core_vault.db/h_users/';


DROP TABLE IF EXISTS core_vault.s_aq_ldc_users;
CREATE TABLE core_vault.s_aq_ldc_users (
    Hub_Hash_Key                   bigint,
    Row_Hash                       bigint,
    application                    varchar(25),
    username                       varchar(25),
    region                         varchar(25),
    office                         varchar(25),
    department                     varchar(25),
    email                          varchar(50),
    Validity_Start                 timestamp,
    Validity_End                   timestamp,
    Creation_Timestamp             timestamp,
    Last_Update_Timestamp          timestamp,
    Is_Current                     boolean,
    Is_Deleted                     boolean
)
USING DELTA
LOCATION 'abfss://010-core@synapsewarehousestorage.dfs.core.windows.net/core_vault.db/s_aq_ldc_users/';


DROP TABLE IF EXISTS core_vault.s_aq_r_users;
CREATE TABLE core_vault.s_aq_r_users (
    Hub_Hash_Key                   bigint,
    Row_Hash                       bigint,
    UserID                         varchar(25),
    Username                       varchar(25),
    Description                    varchar(100),
    GPreAm                         varchar(25),
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
    Validity_Start                 timestamp,
    Validity_End                   timestamp,
    Creation_Timestamp             timestamp,
    Last_Update_Timestamp          timestamp,
    Is_Current                     boolean,
    Is_Deleted                     boolean
)
USING DELTA
LOCATION 'abfss://010-core@synapsewarehousestorage.dfs.core.windows.net/core_vault.db/s_aq_r_users/';
