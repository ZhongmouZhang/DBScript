﻿/*
Deployment script for CMDB_V3

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "CMDB_V3"
:setvar DefaultFilePrefix "CMDB_V3"
:setvar DefaultDataPath "D:\SQL_Data\"
:setvar DefaultLogPath "D:\SQL_Log\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET PAGE_VERIFY NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367)) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Dropping [SqlServerProject].[SqlAssemblyProjectRoot]...';


GO
EXECUTE sp_dropextendedproperty @name = N'SqlAssemblyProjectRoot', @level0type = N'Assembly', @level0name = N'SqlServerProject';


GO
PRINT N'Altering [SqlServerProject]...';


GO
ALTER ASSEMBLY [SqlServerProject]
    DROP FILE ALL;


GO
ALTER ASSEMBLY [SqlServerProject]
    FROM 0x4D5A90000300000004000000FFFF0000B800000000000000400000000000000000000000000000000000000000000000000000000000000000000000800000000E1FBA0E00B409CD21B8014CCD21546869732070726F6772616D2063616E6E6F742062652072756E20696E20444F53206D6F64652E0D0D0A2400000000000000504500004C0103008D90DE580000000000000000E00002210B010B00000A00000006000000000000CE290000002000000040000000000010002000000002000004000000000000000600000000000000008000000002000000000000030060850000100000100000000010000010000000000000100000000000000000000000802900004B00000000400000B803000000000000000000000000000000000000006000000C000000482800001C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000200000080000000000000000000000082000004800000000000000000000002E74657874000000D409000000200000000A000000020000000000000000000000000000200000602E72737263000000B80300000040000000040000000C0000000000000000000000000000400000402E72656C6F6300000C0000000060000000020000001000000000000000000000000000004000004200000000000000000000000000000000B0290000000000004800000002000500142100003407000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001B3002003400000001000011000002280F00000A281000000A6F1100000A169A6F1200000A0A00DE0B0B0072010000700A00DE000006731300000A0C2B00082A01100000000001001C1D000B160000011B3001003200000001000011000002280F00000A281000000A6F1400000A6F1200000A0A00DE0B0B0072110000700A00DE000006731300000A0C2B00082A000001100000000001001A1B000B1600000113300100100000000200001100281500000A731600000A0A2B00062A1E02281700000A2A42534A4201000100000000000C00000076342E302E33303331390000000005006C00000070020000237E0000DC0200005003000023537472696E6773000000002C06000024000000235553005006000010000000234755494400000060060000D400000023426C6F620000000000000002000001471502000900000000FA2533001600000100000017000000020000000400000003000000170000000E00000002000000010000000300000000000A00010000000000060044003D000A006C0057000A00930057000600CB00B9000600E200B9000600FF00B90006001E01B90006003701B90006005001B90006006B01B90006008601B9000600BE019F010600D201B9000600FE01EB013B00120200000600410221020600610221020A00AB0290020E00D702CC020E00DB02CC020E00F402CC02060017033D0006002E033D000000000001000000000001000100010010001F000000050001000100502000000000960076000A000100A02000000000960084000A000200F0200000000096009C00110003000C21000000008618A8001800040000000100AE0000000100AE0000000100AE002100A8001C002900A8001C003100A8001C003900A8001C004100A8001C004900A8001C005100A8001C005900A8001C006100A80021006900A8001C007100A80026008100A8002C008900A80018009100A80018001100C00236009900E7023C00A100FE02420009000E0348001100A8001C00A10021034800B9003A0354001900A8002C000900A80018002000730031002E00230079002E002B005D002E000B005D002E00130073002E001B0073002E003B0073002E004B0073002E006B00B5002E00330085002E005B00A3002E006300AC004000730031006000730031004C00580004800000010000009B1806420000000000007F020000040000000000000000000000010034000000000004000000000000000000000001004B000000000004000000000000000000000001003D00000000000000003C4D6F64756C653E0053716C53657276657250726F6A6563742E646C6C0055736572446566696E656446756E6374696F6E73006D73636F726C69620053797374656D004F626A6563740053797374656D2E446174610053797374656D2E446174612E53716C54797065730053716C537472696E6700666E5F496E7374616E6365495000666E5F496E7374616E636546716E0053716C496E74333200666E5F435055436F756E74002E63746F72007365727665724E616D650053797374656D2E5265666C656374696F6E00417373656D626C795469746C6541747472696275746500417373656D626C794465736372697074696F6E41747472696275746500417373656D626C79436F6E66696775726174696F6E41747472696275746500417373656D626C79436F6D70616E7941747472696275746500417373656D626C7950726F6475637441747472696275746500417373656D626C79436F7079726967687441747472696275746500417373656D626C7954726164656D61726B41747472696275746500417373656D626C7943756C747572654174747269627574650053797374656D2E52756E74696D652E496E7465726F70536572766963657300436F6D56697369626C6541747472696275746500417373656D626C7956657273696F6E4174747269627574650053797374656D2E446961676E6F73746963730044656275676761626C6541747472696275746500446562756767696E674D6F6465730053797374656D2E52756E74696D652E436F6D70696C6572536572766963657300436F6D70696C6174696F6E52656C61786174696F6E734174747269627574650052756E74696D65436F6D7061746962696C6974794174747269627574650053716C53657276657250726F6A656374004D6963726F736F66742E53716C5365727665722E5365727665720053716C46756E6374696F6E417474726962757465006F705F4578706C696369740053797374656D2E4E657400446E73004950486F7374456E74727900476574486F7374456E74727900495041646472657373006765745F416464726573734C69737400546F537472696E6700457863657074696F6E006765745F486F73744E616D6500456E7669726F6E6D656E74006765745F50726F636573736F72436F756E7400000000000F30002E0030002E0030002E003000000F55004E004B004E004F0057004E0000000000078788C1D6CC3444BA715355E40E4A550008B77A5C561934E08906000111091109060001110D110903200001042001010E042001010205200101113D042001010804010000000500010E110905000112510E0520001D12550320000E0707030E1259110903000008040701110D1501001053716C53657276657250726F6A65637400000501000000000B01000650485341424300001D010018436F7079726967687420C2A920504853414243203230313300000801000701000000000801000800000000001E01000100540216577261704E6F6E457863657074696F6E5468726F777301000000008D90DE5800000000020000001C01000064280000640A000052534453B01625BE3923294192487AA028EC36CC01000000633A5C55736572735C4A5A313333375F53415C446F63756D656E74735C446576656C6F706D656E745C53716C53657276657250726F6A6563745C6F626A5C44656275675C53716C53657276657250726F6A6563742E70646200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000A82900000000000000000000BE290000002000000000000000000000000000000000000000000000B02900000000000000005F436F72446C6C4D61696E006D73636F7265652E646C6C0000000000FF25002000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001001000000018000080000000000000000000000000000001000100000030000080000000000000000000000000000001000000000048000000584000005C03000000000000000000005C0334000000560053005F00560045005200530049004F004E005F0049004E0046004F0000000000BD04EFFE000001000000010006429B180000010006429B183F000000000000000400000002000000000000000000000000000000440000000100560061007200460069006C00650049006E0066006F00000000002400040000005400720061006E0073006C006100740069006F006E00000000000000B004BC020000010053007400720069006E006700460069006C00650049006E0066006F00000098020000010030003000300030003000340062003000000030000700010043006F006D00700061006E0079004E0061006D00650000000000500048005300410042004300000000004C0011000100460069006C0065004400650073006300720069007000740069006F006E0000000000530071006C00530065007200760065007200500072006F006A006500630074000000000040000F000100460069006C006500560065007200730069006F006E000000000031002E0030002E0036003200390039002E0031003600390030003200000000004C001500010049006E007400650072006E0061006C004E0061006D0065000000530071006C00530065007200760065007200500072006F006A006500630074002E0064006C006C00000000005400180001004C006500670061006C0043006F007000790072006900670068007400000043006F0070007900720069006700680074002000A90020005000480053004100420043002000320030003100330000005400150001004F0072006900670069006E0061006C00460069006C0065006E0061006D0065000000530071006C00530065007200760065007200500072006F006A006500630074002E0064006C006C0000000000440011000100500072006F0064007500630074004E0061006D00650000000000530071006C00530065007200760065007200500072006F006A006500630074000000000044000F000100500072006F006400750063007400560065007200730069006F006E00000031002E0030002E0036003200390039002E00310036003900300032000000000048000F00010041007300730065006D0062006C0079002000560065007200730069006F006E00000031002E0030002E0036003200390039002E00310036003900300032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000000C000000D03900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;


GO
ALTER ASSEMBLY [SqlServerProject]
    DROP FILE ALL
    ADD FILE FROM 0x4D6963726F736F667420432F432B2B204D534620372E30300D0A1A44530000000002000002000000170000007C0000000000000016000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF380080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0BCA3101380000000010000000100000000000000E00FFFF04000000038000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000BCA3101380000000010000000100000000000000F00FFFF0400000003800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000942E31018D90DE5801000000B01625BE3923294192487AA028EC36CC000000000000000001000000010000000000000000000000000000004191320100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000BCA310138000000001000000010000000000000FFFFFFFF040000000380000000000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000BCA310138000000001000000010000000000000FFFFFFFF040000000380000000000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000F862513FC607D311905300C04FA302A1C4454B99E9E6D211903F00C04FA302A10B9D865A1166D311BD2A0000F80849BD60A66E40CF64824CB6F042D48172A7991000000000000000B1EE30CA8AB963063E5B45768BA677F2000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000760000000000000076000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FEEFFEEF010000009800000000633A5C55736572735C4A5A313333375F53415C446F63756D656E74735C446576656C6F706D656E745C53716C53657276657250726F6A6563745C666E5F496E7374616E636549502E63730000633A5C75736572735C6A7A313333375F73615C646F63756D656E74735C646576656C6F706D656E745C73716C73657276657270726F6A6563745C666E5F696E7374616E636569702E637300040000004C0000004D0000000000000001000000030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001BE23001800000000F2D4A8143AAD20101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000020000000100000002000000000000004D000000280000001BE230014C4D629D58000000010000004C0000004D0000006500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000400000036002A1100000000740100000000000034000000000000000000000001000006000000000100000000666E5F496E7374616E6365495000001600031104000000400100003400000000000000010000000A0024115553797374656D00120024115553797374656D2E44617461000000001A0024115553797374656D2E446174612E53716C436C69656E7400001A0024115553797374656D2E446174612E53716C54797065730000001E002411554D6963726F736F66742E53716C5365727665722E536572766572001E002011020000000100001100000000000004004353243124303030300000001E00201100000000010000110000000000000000697041646472657373000000160003113C0000003C010000080000001E0000000100000016002011010000000100001100000000000000006500000002000600020006002E000404C93FEAC6B359D649BC250902BBABB460000000004D0044003200000004010000040000000C000000010005000200060036002A1100000000680200000000000032000000000000000000000002000006340000000100000000666E5F496E7374616E636546716E001600031178010000340200003200000034000000010000001E00201102000000010000110000000000000400435324312430303030000000160020110000000001000011000000000000000066716E0016000311B00100003002000008000000500000000100000016002011010000000100001100000000000000006500000002000600020006002E000404C93FEAC6B359D649BC250902BBABB460000000004D0044003200000004010000040100000C000000010000060200060036002A1100000000100300000000000010000000000000000000000003000006660000000100000000666E5F435055436F756E7400000000160003116C020000DC0200001000000066000000010000001E00201100000000020000110000000000000400435324312430303030000000020006002E000404C93FEAC6B359D649BC250902BBABB460000000004D00440032000000040100000401D1000C0000000100000602000600F2000000B4000000000000000100010034000000000000000D000000A8000000000000000B000080010000000F00008002000000100000801A000000110000801B000000EEEFFE801D000000120000801E000000130000801F00000014000080250000001500008026000000EEEFFE8028000000EEEFFE80290000001600008032000000170000800500060009000A000D00630009000A000000000009001C0009000A000D00230009000A0000000000000000000900290005000600F2000000B4000000340000000100010032000000000000000D000000A8000000000000001B000080010000001F0000800200000020000080180000002100008019000000EEEFFE801B000000220000801C000000230000801D00000024000080230000002500008024000000EEEFFE8026000000EEEFFE80270000002600008030000000270000800500060009000A000D00570009000A000000000009001C0009000A000D001D0009000A0000000000000000000900230005000600F20000003C000000660000000100010010000000000000000300000030000000000000002B000080010000002D0000800E0000002E000080050006000900390006000700F400000008000000010000000000000018000000000000001C00000034000000540000006C000000880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FFFFFFFF1A092FF1300000001C0200005500000001000000890000000100000001000000010000001D0000000100000035000000010000006D00000001000000010000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008000000000000000000000000010000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000C0000001800000024000000300000003C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001A00251100000000040000000100666E5F496E7374616E63654950001600291100000000040000000100303630303030303100001E00251100000000780100000100666E5F496E7374616E636546716E000000001600291100000000780100000100303630303030303200001A002511000000006C0200000100666E5F435055436F756E7400000016002911000000006C0200000100303630303030303300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000FFFFFFFF1A092FF10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FFFFFFFF77093101010000000B00008C0C0046510D00A08260000000580000002C00000058000000000000000000000016000000190000000000EEC00000000000000000FFFF000000000000FFFFFFFF00000000FFFF0000000000000000000000000A001403000000000000CC0100000100000090D7D700000000000000000055736572446566696E656446756E6374696F6E730037314141414545380000002DBA2EF10100D0000000000034000000000000000000620000000000000000000100270034000000320000000000000000006C00000000000000000001006200660000001000000000000000000072000000000000000000020002000D01000000000100FFFFFFFF00000000760000000802000000000000FFFFFFFF00000000FFFFFFFF010001000000010000000000633A5C55736572735C4A5A313333375F53415C446F63756D656E74735C446576656C6F706D656E745C53716C53657276657250726F6A6563745C666E5F496E7374616E636549502E63730000FEEFFEEF010000000100000000010000000000000000000000FFFFFFFFFFFFFFFFFFFF0900FFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000942E31018D90DE5801000000B01625BE3923294192487AA028EC36CC780000002F4C696E6B496E666F002F6E616D6573002F7372632F686561646572626C6F636B002F7372632F66696C65732F633A5C75736572735C6A7A313333375F73615C646F63756D656E74735C646576656C6F706D656E745C73716C73657276657270726F6A6563745C666E5F696E7374616E636569702E6373000400000006000000010000001B00000000000000220000000800000011000000070000000A00000006000000000000000500000000000000419132010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000E00000020000000D400000038000000AB0100003800000000000000BC000000800000005800000028000000FC0400005C0200002C000000A000000003000000140000000600000013000000070000000A0000000B00000008000000090000000C0000000D0000000E0000000F000000100000001200000011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 AS N'SqlServerProject.pdb';


GO
PRINT N'Creating [dbo].[fn_CPUCount]...';


GO
CREATE FUNCTION [dbo].[fn_CPUCount]
(@serverName NVARCHAR (MAX) NULL)
RETURNS INT
AS
 EXTERNAL NAME [SqlServerProject].[UserDefinedFunctions].[fn_CPUCount]


GO
PRINT N'Creating [dbo].[fn_InstanceFqn]...';


GO
CREATE FUNCTION [dbo].[fn_InstanceFqn]
(@serverName NVARCHAR (MAX) NULL)
RETURNS NVARCHAR (MAX)
AS
 EXTERNAL NAME [SqlServerProject].[UserDefinedFunctions].[fn_InstanceFqn]


GO
PRINT N'Creating [dbo].[fn_InstanceIP]...';


GO
CREATE FUNCTION [dbo].[fn_InstanceIP]
(@serverName NVARCHAR (MAX) NULL)
RETURNS NVARCHAR (MAX)
AS
 EXTERNAL NAME [SqlServerProject].[UserDefinedFunctions].[fn_InstanceIP]


GO
PRINT N'Update complete.';


GO
