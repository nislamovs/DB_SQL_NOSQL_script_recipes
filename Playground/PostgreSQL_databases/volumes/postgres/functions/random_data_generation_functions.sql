DROP FUNCTION IF EXISTS GET_RANDOM_GENDER;
CREATE OR REPLACE FUNCTION GET_RANDOM_GENDER() RETURNS VARCHAR(20) LANGUAGE plpgsql
AS $$
    DECLARE
        DECLARE loc_genders VARCHAR(20) := 'MALE,FEMALE';
        DECLARE loc_item_index INTEGER := (SELECT (FLOOR( 1 + RANDOM( ) * 2 )) );
        DECLARE loc_pre_result VARCHAR(20) := SPLIT_PART(loc_genders, ',', loc_item_index);
        DECLARE loc_result VARCHAR(20) := SPLIT_PART(loc_pre_result, ',', -1);
    BEGIN
        RETURN loc_result;
    END;
$$;

DROP FUNCTION IF EXISTS GET_RANDOM_FIRSTNAME;
CREATE OR REPLACE FUNCTION GET_RANDOM_FIRSTNAME() RETURNS VARCHAR(20) LANGUAGE plpgsql
AS $$

    DECLARE loc_firstnames TEXT :=
        'Kissiah,Chet,Sheeree,Gavin,Koral,Thomasin,Brien,Leticia,Vanni,Winona,Shirl,Lexie,Livvy,Hale,Gael,Gill,Maire,Ilene,Hatty,
        Jeniffer,Prudi,Vinny,Tabb,Birch,Sheilah,Goddart,Dorelia,Caty,Ann-marie,Eudora,Leyla,Prisca,Gerald,Tedra,Amie,Cassondra,
        Hurley,Maynord,Sumner,Arri,Jack,Carlin,Gisela,Bessie,Emlyn,Dalli,Arabella,Nahum,Vanna,Eddie,Leslie,Georgine,Elysia,Tomasina,
        Valerye,Evanne,Gratiana,Vidovic,Llewellyn,Romona,Sheila-kathryn,Janessa,Bianca,Robyn,Dasya,Patten,Nalani,Adan,Malena,
        Griswold,Averell,Gare,Jessie,Brier,Emmeline,Emmalee,Babara,Shepard,Hendrika,Devan,Cris,Elwyn,Brockie,Quinlan,Haroun,
        Janean,Doreen,Sherline,Dorian,Ramsey,Leah,Carline,Torre,Milzie,Lonny,Maible,Stoddard,Polly,Chevy,Nell,Demetris,Niven,
        Boyd,May,Olly,Riobard,Laetitia,Joycelin,Gordy,Domingo,Melisse,Duffie,Sherlocke,Sheelah,Cob,Millard,Wendeline,Ginnifer,
        Robinette,Brigitta,Clayton,Antonella,Bert,Hyman,Janette,Germaine,Codie,Cherin,Eryn,Jilli,Goldarina,Scarlet,Scot,Karia,
        Paulina,Doyle,Petra,Nilson,Lindsey,Lauren,Morrie,June,Gannon,Ellen,Rex,Mart,Ebonee,Arabela,Morgen,Kate,Ty,Annemarie,Priscella,
        Isador,Jaquelyn,Lonny,Shalne,Allina,Tiffie,Tedie,Eddy,Gracia,Morse,Starr,Cheston,Chris,Tedman,Kennie,Minny,Lee,Merrily,
        Olympie,Travis,Cornie,Alex,Zahara,Westleigh,Mikkel,Danica,Suzann,Laverne,Tabbatha,Enrica,Easter,Jacques,Ajay,Frayda,
        Bernice,Eli,Greggory,Nowell,Rosemary,Carmelle,Valeria,Claudius,Norris,Carmelina,Will,Emlynne,Lorettalorna,Emelina,
        Peirce,Cori,Beverly,Olvan,Auria,Carlotta,Alyss,Maudie,Shaw,Jonathon,Riccardo,Fabio,Keelby,Gwenette,Mirabella,Jimmie,
        Silvanus,Saxe,Zorah,Shellie,Mordy,Norene,Kerri,Alain,Ignacius,Tonie,Cordy,Breanne,Bernadina,Margalo,Stearne,Belle,
        Zorana,Gawen,Donna,Alicia,Hartley,Sumner,Eba,Nerita,Brent,Coralie,Dominga,Arliene,Zachariah,Rad,Rosita,Corly,Gisela,
        Merrie,Giffer,Baron,Brandtr,Monro,Garek,Carroll,Chelsea,Sam,Rebekah,Bertrand,Frederigo,Nolana,Leda,Cyrill,Danila,Jerald,
        Inna,Mohandis,Valentine,Kelley,Addy,Jennilee,Durand,Colleen,Bibby,Arthur,Fletch,Frieda,Sisile,Joelie,Onfroi,Rozella,Kerrill,
        Christyna,Rusty,Krystle,Benita,Emerson,Harold,Oliy,Pat,Heddie,Claus,Noble,Vivi,Tootsie,Traci,Cherin,Giffy,Gracia,Irwin,
        Renault,Kara-lynn,Yasmeen,Murry,Elbertine,Mac,Turner,Mauricio,Norene,Chrisse,Andres,Billy,Dyana,Sam,Suzann,Georgianna,Opaline,
        Caroline,Jehanna,Peder,Steffen,Breanne,Lezlie,Melodee,Arabele,Jayme,Hollis,Murvyn,Rayshell,Pete,Fleur,Gannie,Edith,Wilow,
        Pru,Barthel,Vance,Forest,Roscoe,Gerome,Enrichetta,Alicea,Padgett,Concordia,Xever,Kaitlin,Ellynn,Margette,Catherina,Cointon,
        Martina,Perceval,Charlean,Haydon,Rivi,Marietta,Cornie,Woodman,Allison,Rhea,Phoebe,Amy,Selia,Olympie,Ruthie,Dorie,Ermentrude,
        Taryn,Kurt,Brannon,Brandea,Korella,Dorita,Lucien,Elane,Christophe,Ame,Edna,Gae,Jewell,Dino,Heinrick,Lesya,Chilton,Darbee,
        Beilul,Eloise,Stacy,Quinta,Carlina,Franklyn,Karen,Gerard,Griz,Timmie,Caleb,Lenora,Tamar,Ula,Otto,Coletta,Clarabelle,Sarena,
        Antony,Lynnell,Parry,Dodi,Shelba,Gwenni,Sidoney,Jerome,Sid,Carmelita,Lucinda,Ulises,Jeanelle,Idette,Sallyann,Layton,Dannie,
        Shaughn,Rubin,Catlaina,Dukie,Janet,Querida,Jake,Gasparo,Brooke,Reece,Lewiss,Drew,Manny,Jared,Perkin,Nelson,Hannie,Jacques,
        Aundrea,Bibbye,Claudius,Shadow,Ninnetta,Barny,Dorolice,Kean,Kristin,Nicola,Katerina,Cozmo,Florry,Addy,Omar,Dollie,Odella,
        Patsy,Meris,Cheri,Bevin,Ailis,Renato,Harold,Martina,Lilyan,Antoinette,Vlad,Amble,Yardley,Ursuline,Anne-corinne,Rosette,
        Anthe,Harmon,Xymenes,Chris,Valle,Tiebold,Carleton,Ab,Tiphanie,Bord,Gabby,Hewet,Raychel,Tam,Torrey,Pepe,Kareem,Aurlie,Olimpia,
        Freeland,Meredeth,Del,Thomasine,Greer,Fifi,Russell,Elena,Nyssa,Ker,Jeniece,Emilie,Rory,Ringo,Paula,Pietra,Cosmo,Imojean,Morganne,
        Cissy,Buck,Chevalier,Hermione,Donall,Reg,Heather,Valida,Catharina,Carlyle,Layla,Forster,Sauncho,Pieter,Jeremy,Errick,Rosa,
        Fonz,Isaiah,Ferd,Domenic,Brigg,Didi,Jarret,Levin,Petrina,Mari,Mischa,Roxine,Ailey,Susanetta,Averil,Babita,Andra,Sophronia,
        Tobi,Reynard,Umberto,Torrie,Ryan,Jayson,Krystalle,Caterina,Lorrayne,Napoleon,Ravi,John,Eydie,Clea,Lemmy,Martina,Anna-maria,Colline';

    DECLARE loc_item_index INTEGER := (SELECT (FLOOR( 1 + RANDOM( ) * 500 )) );
    DECLARE loc_pre_result VARCHAR(20) := SPLIT_PART(loc_firstnames, ',', loc_item_index);
    DECLARE loc_result VARCHAR(20) := SPLIT_PART(loc_pre_result, ',', -1);

    BEGIN
        RETURN loc_result;
    END;
$$;

DROP FUNCTION IF EXISTS GET_RANDOM_LASTNAME;
CREATE OR REPLACE FUNCTION GET_RANDOM_LASTNAME() RETURNS VARCHAR(20) LANGUAGE plpgsql
AS $$

    DECLARE loc_lastnames TEXT :=
        'Willcox,Boulding,Bounde,Prop,Dulake,Pollendine,Randerson,Jedrzej,Tether,Litchfield,Remirez,Moxley,Sambles,Ivchenko,Pleass,Paur,Marlor,
        Cluney,Albinson,Tooth,Hebborne,Punch,Smorthwaite,Wapol,Cush,Poznan,Umfrey,De Vaar,Lissandrini,Janovsky,Minshaw,Barrick,
        Dincke,Sambedge,Orto,Louch,Leith-Harvey,Slafford,Rigg,Kenyon,Roylance,Enser,Anstead,Poles,Saint,Cadding,Trendle,Nials,Fowden,
        Mungane,Andrys,Levay,Mossbee,Kleinzweig,Isherwood,Semour,Risom,Cumine,Figurski,Grane,Figger,Greystock,Edgeller,Muzzall,
        Saffrin,Sisley,Cadwaladr,Varker,Jump,Ganley,Glenn,Marron,Wyne,Mayston,Battista,O''Carrol,Neles,Drewry,Milthorpe,Kellick,
        Gatecliff,Torbett,Lambarth,Fears,Ambrosio,Gurney,Aspole,Myrick,Cuel,Yitshak,Pering,Bindin,Choppen,Beasleigh,Ferenc,Defraine,
        Rutherford,Meechan,Hamshaw,Ferreiro,Waldie,Losel,Rohmer,Marney,Floyed,Caswell,Wetherhead,Sarfati,Jumonet,Tumilson,Vigours,
        Camillo,Haggard,Tezure,McVane,Bickerstasse,Marjot,Gadsdon,Clogg,Coffelt,Bartolomucci,Tipler,Regorz,Hainsworth,Beastall,
        Battrum,Shone,McCome,Spenceley,Szymoni,Kyncl,Every,Cuesta,Canas,Monkeman,Ranyard,Etock,Tedridge,Larham,Knuckles,Duplain,
        Cordey,Cowterd,Schrinel,Elcom,Jirak,Lared,Windows,Durrand,Bartolomeo,Mascall,Etty,Commucci,Tackle,Glanders,Vida,Slate,
        Oldknowe,Fearn,Hustings,De Ruel,Halliwell,Smerdon,Berriball,Tullis,Murkitt,Ferrier,Veschambes,Scrivens,Aphale,Saterthwait,
        O''Crowley,Spellward,Andrat,Fearnyough,Saxby,Sheal,Seiler,Dallywater,Palluschek,Charker,Lackham,Spearett,Lawee,Praundl,
        Reina,Witchard,Rillstone,Gristwood,Usherwood,Parish,Brotherhead,Coughtrey,Jira,Cosyns,Coleford,Alforde,Beaulieu,Fegan,
        Nowland,McAllester,Hewins,Edwardson,Bulter,Cullnean,Simony,Partridge,Epdell,Bunclark,Spenley,Lydden,Averay,Grishankov,
        Aulton,Brotherton,Dank,Ditzel,Yuryichev,Seagrove,O'' Hogan,Matijasevic,Bleasby,MacAdie,Corballis,Millam,Whyteman,Vaughton,
        Seiller,Booth-Jarvis,Darinton,Glasbey,Herche,Saddleton,Syrie,Halleybone,Dowdell,Brace,Brimblecombe,Ship,Woodley,Melling,
        Powdrill,Devas,Haisell,Bard,Salvage,Reboul,Yter,Sproul,McIsaac,Monard,Blakebrough,Correa,Longhorn,Percifull,Rimell,Screas,
        Schusterl,Shalliker,Bleddon,Piquard,McQuie,Dare,Anton,Secrett,Crosham,Shuttlewood,Rudsdale,Koppe,Fearnill,Roadknight,
        Berndtssen,Tireman,Leile,Have,Bakhrushin,Challes,Diloway,Roscow,Matton,La Batie,Kilfeather,Eyeington,Murdy,MacKaig,Welds,
        Tomaskunas,Gorvin,Afield,Capner,De Micoli,Lawee,Cuerdale,Hothersall,Conklin,Dealey,Yokelman,Forsdike,Chin,Deeks,Woodrooffe,
        Sangwin,Stair,Scrivinor,Valentine,Rainton,Ciobotaru,Friedenbach,Carrol,Fer,de Mendoza,Georgeson,Corbyn,Wornham,Lorait,McGuckin,
        Ricart,Cajkler,Emer,Peattie,Matthensen,Muckle,Ropking,Collimore,Lankester,McGilmartin,Walling,McCowen,Fieldhouse,Smallridge,
        Mityakov,Domek,Grier,Downgate,Garling,Spender,Brocklesby,Girdwood,Husher,Avison,Drew,Arlett,Clissett,Monday,Wycliffe,
        Schimpke,Swayton,Pawels,MacAleese,Brightie,Doulton,McGing,Stormouth,Gwyllt,Lukianov,Huffer,Groucutt,Birtwistle,Cortin,
        Norton,Streak,Rodolf,Hartzenberg,Baynam,McAlester,Caneo,Shurmer,Spirritt,Gretton,Jandel,Whillock,Sommerville,Haye,Wheeler,
        Warlton,Keave,Collete,Hosten,Ashbe,Chitson,Marrow,Boaler,Showte,Rosander,Salack,Rushby,Loney,McHardy,Leyshon,Kingswoode,
        Galpin,Treven,Taile,Kelk,Sanz,Grahamslaw,Ivatt,Fairbard,Harraway,Lyle,Kearns,Killik,Tyce,Kem,Wyman,Aylmore,Presslee,
        Hebbard,Kubek,Folonin,Lowseley,Dawks,Potebury,Cashley,Louw,Goskar,Buick,Eisikowitz,Lackington,Malyj,Simonsson,Peerman,
        Washington,Grigaut,Snookes,McFaul,Bezzant,Signorelli,Lawles,Guynemer,Haszard,Snaith,Bellison,Chillingworth,Wallwork,Creasey,
        D''Adda,Mc Kellen,Ryley,Basten,Wermerling,Finneran,Storr,Screeton,Jumont,Laughtisse,Bakhrushkin,Garrow,Skains,O''Bradden,
        Breeds,Healks,Ekless,Gallafant,Moatt,Dorrell,Forstall,Sydney,Humbatch,Stanlake,Blaydon,Mosey,Pennells,MacKartan,Oolahan,
        Iacovaccio,Reveley,Cockett,Greenless,Ellingham,Rouf,Philpots,Spata,Echallie,Vizor,Siggery,Yeatman,Bysouth,Westwick,Antyshev,
        Anthon,Spanton,Jouannisson,O''Kinedy,Hylands,Dupre,Marcq,Greenacre,Armes,Drakeley,Sproson,Gatman,McCoole,Cattermoul,Sollowaye,
        Haxby,Henner,Samet,Blodget,Bengall';

    DECLARE loc_item_index INTEGER := (SELECT (FLOOR( 1 + RANDOM( ) * 500 )) );
    DECLARE loc_pre_result VARCHAR(30) := SPLIT_PART(loc_lastnames, ',', loc_item_index);
    DECLARE loc_result VARCHAR(20) := SPLIT_PART(loc_pre_result, ',', -1);

    BEGIN
        RETURN loc_result;
    END;
$$;

DROP FUNCTION IF EXISTS GET_RANDOM_BIRTHDATE;
CREATE OR REPLACE FUNCTION GET_RANDOM_BIRTHDATE(min_age INTEGER, max_age INTEGER) RETURNS DATE LANGUAGE plpgsql
AS $$

    -- Now() - loc_year_base + loc_year_delta - loc_week_delta

    DECLARE loc_min_age INTEGER := min_age;
    DECLARE loc_max_age INTEGER := max_age;
    DECLARE loc_week_delta INTEGER := (SELECT FLOOR(1 + (RANDOM() * 52)) );
    DECLARE loc_year_delta INTEGER := (SELECT (FLOOR( 1 + RANDOM( ) * (loc_max_age - loc_min_age) )) );
    DECLARE loc_year_base INTEGER := loc_max_age;

    DECLARE loc_pre_result DATE :=  NOW() - loc_year_base * INTERVAL '1 YEAR' + loc_year_delta * INTERVAL '1 YEAR' + loc_week_delta * INTERVAL '1 WEEK';
    DECLARE loc_result VARCHAR(30) := (SELECT TO_CHAR(loc_pre_result, '%m/%d/%Y') );

    BEGIN
        RETURN TO_DATE(loc_result, '%m/%d/%Y');
    END;
$$;

DROP FUNCTION IF EXISTS GET_RANDOM_MARK_DATE;
CREATE OR REPLACE FUNCTION GET_RANDOM_MARK_DATE(week_interval INTEGER) RETURNS DATE LANGUAGE plpgsql
AS $$

    -- Now() - loc_week_delta

    DECLARE loc_week_interval INTEGER := week_interval;
    DECLARE loc_week_delta INTEGER := (SELECT FLOOR(1 + (RANDOM() * loc_week_interval)) );

    DECLARE loc_pre_result DATE := NOW() - loc_week_delta * INTERVAL '1 WEEK';
    DECLARE loc_result VARCHAR(50) := (SELECT TO_CHAR(loc_pre_result, '%m/%d/%Y') );

    BEGIN
         RETURN TO_DATE(loc_result, '%m/%d/%Y');
    END;
$$;

DROP FUNCTION IF EXISTS GET_RANDOM_EMAIL;
CREATE OR REPLACE FUNCTION GET_RANDOM_EMAIL() RETURNS VARCHAR(100) LANGUAGE plpgsql
AS $$

    DECLARE loc_email_postfixes VARCHAR(100) := 'loc_gmail.com,loc_inbox.lv,loc_10minutesmail.com,loc_protonmail.com';
    DECLARE loc_item_index INTEGER := (SELECT (FLOOR( 1 + RANDOM( ) * 3 )) );
    DECLARE loc_pre_result VARCHAR(100) := SPLIT_PART(loc_email_postfixes, ',', loc_item_index);
    DECLARE loc_email_postfix VARCHAR(20) := SPLIT_PART(loc_pre_result, ',', -1);

    DECLARE loc_result VARCHAR(100):= CONCAT(GET_RANDOM_FIRSTNAME(), '.', GET_RANDOM_LASTNAME(), loc_email_postfix);

    BEGIN
        RETURN loc_result;
    END;
$$;

DROP FUNCTION IF EXISTS GET_EMAIL;
CREATE OR REPLACE FUNCTION GET_EMAIL(firstname VARCHAR(30), lastname VARCHAR(30)) RETURNS VARCHAR(100) LANGUAGE plpgsql
AS $$

    DECLARE loc_firstname VARCHAR(30) := firstname;
    DECLARE loc_lastname VARCHAR(30) := lastname;
    DECLARE loc_email_postfixes VARCHAR(60) := 'gmail.com,inbox.lv,10minutesmail.com,protonmail.com';
    DECLARE loc_item_index INTEGER := (SELECT (FLOOR( 1 + RANDOM( ) * 3 )) );
    DECLARE loc_pre_result VARCHAR(60) := SPLIT_PART(loc_email_postfixes, ',', loc_item_index);
    DECLARE loc_email_postfix VARCHAR(20):= SPLIT_PART(loc_pre_result, ',', -1);

    DECLARE loc_result VARCHAR(100) := CONCAT(loc_firstname, '.', loc_lastname, loc_email_postfix);

    BEGIN
        RETURN loc_result;
    END;
$$;

DROP FUNCTION IF EXISTS GET_RANDOM_CLASS_TYPE;
CREATE OR REPLACE FUNCTION GET_RANDOM_CLASS_TYPE() RETURNS VARCHAR(25) LANGUAGE plpgsql
AS $$

    DECLARE loc_class_types VARCHAR(40) := 'Mathematical,Lingual,Basic,Correctional';
    DECLARE loc_item_index INTEGER := (SELECT (FLOOR( 1 + RANDOM( ) * 4 )) );
    DECLARE loc_pre_result VARCHAR(40) := SPLIT_PART(loc_class_types, ',', loc_item_index);
    DECLARE loc_result VARCHAR(25) := SPLIT_PART(loc_pre_result, ',', -1);

    BEGIN
        RETURN loc_result;
    END;
$$;

DROP FUNCTION IF EXISTS GET_RANDOM_CLASS_NAME;
CREATE OR REPLACE FUNCTION GET_RANDOM_CLASS_NAME() RETURNS VARCHAR(5) LANGUAGE plpgsql
AS $$

    DECLARE loc_class_types VARCHAR(60) := 'A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z';
    DECLARE loc_item_index INTEGER := (SELECT (FLOOR( 1 + RANDOM( ) * 22 )) );
    DECLARE loc_pre_result VARCHAR(60) := SPLIT_PART(loc_class_types, ',', loc_item_index);
    DECLARE loc_letter_index VARCHAR(2) := SPLIT_PART(loc_pre_result, ',', -1);

    DECLARE loc_class_number INTEGER := (SELECT (FLOOR( 1 + RANDOM( ) * 12 )) );
    DECLARE loc_result VARCHAR(3) := CONCAT(loc_class_number,loc_letter_index);

    BEGIN
        RETURN loc_result;
    END;
$$;

DROP FUNCTION IF EXISTS GET_RANDOM_SUBJECT;
CREATE OR REPLACE FUNCTION GET_RANDOM_SUBJECT() RETURNS VARCHAR(25) LANGUAGE plpgsql
AS $$

    DECLARE loc_subject_num INTEGER := (SELECT COUNT(*) FROM subjects);
    DECLARE loc_subjects TEXT := 'Math,Literature,Sport,English,Latvian,Russian,Biology,Physics,Chemistry,History,Geography,Economics';
    DECLARE loc_item_index INTEGER := (SELECT (FLOOR( 1 + RANDOM( ) *  loc_subject_num)) );
    DECLARE loc_pre_result TEXT := SPLIT_PART(loc_subjects, ',', loc_item_index);
    DECLARE loc_result VARCHAR(25) := SPLIT_PART(loc_pre_result, ',', -1);

    BEGIN
        RETURN loc_result;
    END;
$$;

DROP FUNCTION IF EXISTS GET_RANDOM_SUBJECT_ID;
CREATE OR REPLACE FUNCTION GET_RANDOM_SUBJECT_ID() RETURNS INTEGER LANGUAGE plpgsql
AS $$

    DECLARE loc_subject_num INTEGER := (SELECT COUNT(*) FROM subjects);
    DECLARE loc_result INTEGER := (SELECT (FLOOR( 1 + RANDOM( ) *  loc_subject_num)) );

    BEGIN
        RETURN loc_result;
    END;
$$;