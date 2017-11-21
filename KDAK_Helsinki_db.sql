-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.0
-- PostgreSQL version: 9.6
-- Project Site: pgmodeler.com.br
-- Model Author: ---


-- Database creation must be done outside an multicommand file.
-- These commands were put in this file only for convenience.
-- -- object: "Asemakaavat" | type: DATABASE --
-- -- DROP DATABASE IF EXISTS "Asemakaavat";
-- 
-- -- Prepended SQL commands --
-- CREATE EXTENSION IF NOT EXISTS POSTGIS;
-- -- ddl-end --
-- 
-- CREATE DATABASE "Asemakaavat"
-- 	ENCODING = 'UTF8'
-- 	TABLESPACE = pg_default
-- 	OWNER = postgres
-- ;
-- -- ddl-end --
-- 

-- object: asemakaavat | type: SCHEMA --
-- DROP SCHEMA IF EXISTS asemakaavat CASCADE;
CREATE SCHEMA asemakaavat;
-- ddl-end --
ALTER SCHEMA asemakaavat OWNER TO postgres;
-- ddl-end --

-- object: koodistot | type: SCHEMA --
-- DROP SCHEMA IF EXISTS koodistot CASCADE;
CREATE SCHEMA koodistot;
-- ddl-end --
ALTER SCHEMA koodistot OWNER TO postgres;
-- ddl-end --
COMMENT ON SCHEMA koodistot IS 'Erilaiset koodistot ja luokitukset';
-- ddl-end --

SET search_path TO pg_catalog,public,asemakaavat,koodistot;
-- ddl-end --

-- object: asemakaavat."Asemakaava" | type: TABLE --
-- DROP TABLE IF EXISTS asemakaavat."Asemakaava" CASCADE;
CREATE TABLE asemakaavat."Asemakaava"(
	gid serial,
	geom geometry(MULTISURFACEZ, 3878),
	"Asemakaava__uuid" uuid NOT NULL,
	"Kaavatunnus" varchar(20),
	"Hanketunnus" varchar(20),
	"Kieli1" varchar(10),
	"Kieli2" varchar(10),
	"Kaavanimi1" varchar(50),
	"Kaavanimi2" varchar(50),
	"Kaavanlaatija" varchar(50),
	"Hyvaksyja" varchar(50),
	"VireilletuloPVM" date,
	"HyvaksymisPVM" date,
	"VoimaantuloPVM" date,
	"Kuntakoodi" smallint,
	"KaavanVaihe" smallint,
	"Kaavatyyppi" smallint,
	"Kaavatyyppi2" smallint,
	"Aluesijainti" smallint,
	"NahtavilleAlkuPVM" date,
	"NahtavilleViimPVM" date,
	"Kaavamaarayskirjasto" varchar(200),
	"Kaavalinkki" varchar(50),
	"PintaAla" real,
	"LuontiPVM" date,
	"DatanLuoja" varchar(50),
	"MuokkausPVM" date,
	"DatanMuokkaaja" varchar(50),
	"HistoriaPVM" date,
	"DatanOmistaja" varchar(50),
	CONSTRAINT asemakaava_uuid_pk PRIMARY KEY ("Asemakaava__uuid")

);
-- ddl-end --
COMMENT ON TABLE asemakaavat."Asemakaava" IS 'Geometria kuvaa asemakaavan ulkoraja';
-- ddl-end --
COMMENT ON COLUMN asemakaavat."Asemakaava".geom IS 'Asemakaavan ulkoraja';
-- ddl-end --
COMMENT ON COLUMN asemakaavat."Asemakaava"."Kaavanimi1" IS 'Asemakaavan nimi';
-- ddl-end --
COMMENT ON COLUMN asemakaavat."Asemakaava"."Hyvaksyja" IS 'Kaavan hyväksyjä';
-- ddl-end --
COMMENT ON COLUMN asemakaavat."Asemakaava"."VireilletuloPVM" IS 'Vireille tulo päivämäärä';
-- ddl-end --
COMMENT ON COLUMN asemakaavat."Asemakaava"."HyvaksymisPVM" IS 'Hyväksymis päivämäärä';
-- ddl-end --
COMMENT ON COLUMN asemakaavat."Asemakaava"."VoimaantuloPVM" IS 'Voimaantulo päivämäärä';
-- ddl-end --
COMMENT ON COLUMN asemakaavat."Asemakaava"."Kaavatyyppi" IS 'Kaavantyyppi';
-- ddl-end --
ALTER TABLE asemakaavat."Asemakaava" OWNER TO postgres;
-- ddl-end --

-- object: asemakaavat."Tontti" | type: TABLE --
-- DROP TABLE IF EXISTS asemakaavat."Tontti" CASCADE;
CREATE TABLE asemakaavat."Tontti"(
	gid serial,
	geom geometry(MULTISURFACEZ, 3878),
	"Tontti_uuid" smallint NOT NULL,
	"Tyyppi" smallint,
	"Kunta" char(3),
	"SijaintiAlue" smallint,
	"Ryhma" smallint,
	"Yksikko" smallint,
	"KohteenVaihe" smallint,
	"Tehokkuusluku" real,
	"Km2" real,
	"LisaKm2" real,
	"LisaKm2Kuvaus" varchar(50),
	"YhteensaKm2" real,
	"KaytettyKm2" real,
	"Poistettava" boolean,
	"Lisatietoja" varchar(200),
	"Kellari" real,
	"Kerrosluku" smallint,
	"Ullakko" real,
	"PintaAla" real,
	"LuontiPVM" date,
	"DatanLuoja" varchar(50),
	"MuokkausPVM" date,
	"DatanMuokkaaja" varchar(50),
	"HistoriaPVM" date,
	"DatanOmistaja" varchar(50),
	"Korttelialue_uuid_KortteliAlue" uuid NOT NULL,
	CONSTRAINT tontti_uuid_pk PRIMARY KEY ("Tontti_uuid")

);
-- ddl-end --
ALTER TABLE asemakaavat."Tontti" OWNER TO postgres;
-- ddl-end --

-- object: asemakaavat."AlueidenKayttotarkoitus" | type: TYPE --
-- DROP TYPE IF EXISTS asemakaavat."AlueidenKayttotarkoitus" CASCADE;
CREATE TYPE asemakaavat."AlueidenKayttotarkoitus" AS
 ENUM ('A','P','Y','C','K','T','Virkistysalue','Liikennealue','Erityisalue','Suojelualue','Vesialue','Loma- ja matkailualue','Maa- ja metsätalousalue');
-- ddl-end --
ALTER TYPE asemakaavat."AlueidenKayttotarkoitus" OWNER TO postgres;
-- ddl-end --
COMMENT ON TYPE asemakaavat."AlueidenKayttotarkoitus" IS 'Asemakaava-alueiden käyttötarkoitukset';
-- ddl-end --

-- object: asemakaavat."KaavaMaarays" | type: TABLE --
-- DROP TABLE IF EXISTS asemakaavat."KaavaMaarays" CASCADE;
CREATE TABLE asemakaavat."KaavaMaarays"(
	gid serial,
	geom_point geometry(MULTIPOINTZ, 3878),
	geom_line geometry(MULTICURVEZ, 3878),
	geom_poly geometry(MULTISURFACEZ, 3878),
	kaavamaarays_uuid uuid NOT NULL,
	"Luokka" smallint,
	"Tyyppi" smallint,
	"KohdeNimi" varchar(200),
	"Asemakaava__uuid_Asemakaava" uuid NOT NULL,
	"Rakennusala_uuid_Rakennusala" uuid,
	"YmparistoAlue_uuid_YmparistoAlue" uuid,
	CONSTRAINT kaavamaarays_uuid_pk PRIMARY KEY (kaavamaarays_uuid)

);
-- ddl-end --
ALTER TABLE asemakaavat."KaavaMaarays" OWNER TO postgres;
-- ddl-end --

-- object: asemakaavat."YleinenAlue_MuuAlue" | type: TABLE --
-- DROP TABLE IF EXISTS asemakaavat."YleinenAlue_MuuAlue" CASCADE;
CREATE TABLE asemakaavat."YleinenAlue_MuuAlue"(
	gid serial,
	geom geometry(MULTISURFACEZ, 3878),
	"YleinenAlue_uuid" uuid NOT NULL,
	"Maanalainen" boolean,
	"KohteenVaihe" smallint,
	"Tehokkuusluku" real,
	"Kaavamerkinta" char(5),
	"Km2" real,
	"LisaKm2" real,
	"KaytettyKm2" real,
	"Kellari" real,
	"Kerrosluku" real,
	"Ullakko" real,
	"Korttelinumero" smallint,
	"KnumeroKartalle" boolean,
	"PintaAla" real,
	"Lisatietoja" varchar(50),
	"LuontiPVM" date,
	"DatanLuoja" varchar(50),
	"MuokkausPVM" smallint,
	"DatanMuokkaaja" varchar(50),
	"HistoriaPVM" date,
	"LisaKm2Kuvaus" varchar(200),
	"Asemakaava__uuid_Asemakaava" uuid NOT NULL,
	"AK_tunniste_AK_luokka" varchar(10),
	"AK_tunniste_AK_tyyppi" varchar(10),
	CONSTRAINT yleinenalue_uuid_pk PRIMARY KEY ("YleinenAlue_uuid")

);
-- ddl-end --
COMMENT ON COLUMN asemakaavat."YleinenAlue_MuuAlue"."Kaavamerkinta" IS 'Kaavamerkintä';
-- ddl-end --
COMMENT ON COLUMN asemakaavat."YleinenAlue_MuuAlue"."Km2" IS 'Kerrosneliömetrit';
-- ddl-end --
COMMENT ON COLUMN asemakaavat."YleinenAlue_MuuAlue"."LisaKm2" IS 'Lisä-kerrosneliömetrit';
-- ddl-end --
COMMENT ON COLUMN asemakaavat."YleinenAlue_MuuAlue"."KaytettyKm2" IS 'Käytetyt kerrosneliömetrit';
-- ddl-end --
COMMENT ON COLUMN asemakaavat."YleinenAlue_MuuAlue"."LuontiPVM" IS 'Luonti päivämäärä';
-- ddl-end --
COMMENT ON COLUMN asemakaavat."YleinenAlue_MuuAlue"."DatanLuoja" IS 'Datan luoja';
-- ddl-end --
COMMENT ON COLUMN asemakaavat."YleinenAlue_MuuAlue"."MuokkausPVM" IS 'Muokkaus päivämäärä';
-- ddl-end --
COMMENT ON COLUMN asemakaavat."YleinenAlue_MuuAlue"."DatanMuokkaaja" IS 'Datan muokkaaja';
-- ddl-end --
COMMENT ON COLUMN asemakaavat."YleinenAlue_MuuAlue"."HistoriaPVM" IS 'Historian päivämäärä (???)';
-- ddl-end --
COMMENT ON COLUMN asemakaavat."YleinenAlue_MuuAlue"."LisaKm2Kuvaus" IS 'Lisäkerrosneliömetrien kuvaus';
-- ddl-end --
ALTER TABLE asemakaavat."YleinenAlue_MuuAlue" OWNER TO postgres;
-- ddl-end --

-- object: asemakaavat."KortteliAlue" | type: TABLE --
-- DROP TABLE IF EXISTS asemakaavat."KortteliAlue" CASCADE;
CREATE TABLE asemakaavat."KortteliAlue"(
	gid serial,
	geom geometry(MULTISURFACEZ, 3878),
	"Korttelialue_uuid" uuid NOT NULL,
	"Poistettava" boolean,
	"Maanalainen" boolean,
	"KohteenVaihe" smallint,
	"Tehokkuusluku" real,
	"Kaavamerkinta" char(5),
	"Km2" real,
	"LisaKm2" real,
	"LisaKm2Kuvaus" varchar(50),
	"YhteensaKm2" real,
	"KaytettyKm2" real,
	"Kellari" real,
	"Kerrosluku" smallint,
	"Ullakko" real,
	"Korttelinumero" smallint,
	"KnumeroKartalle" boolean,
	"PintaAla" real,
	"Lisatietoja" varchar(200),
	"LuontiPVM" date,
	"DatanLuoja" varchar(50),
	"MuokkausPVM" date,
	"DatanMuokkaaja" varchar(50),
	"HistoriaPVM" date,
	"Asemakaava__uuid_Asemakaava" uuid NOT NULL,
	"AK_tunniste_AK_luokka" varchar(10),
	"AK_tunniste_AK_tyyppi" varchar(10),
	CONSTRAINT korttelialue_uuid_pk PRIMARY KEY ("Korttelialue_uuid")

);
-- ddl-end --
COMMENT ON COLUMN asemakaavat."KortteliAlue"."Kaavamerkinta" IS 'Kaavamerkintä';
-- ddl-end --
COMMENT ON COLUMN asemakaavat."KortteliAlue"."Km2" IS 'Kerrosneliömetrit';
-- ddl-end --
COMMENT ON COLUMN asemakaavat."KortteliAlue"."LisaKm2" IS 'Lisäkerrosneliömetrit';
-- ddl-end --
COMMENT ON COLUMN asemakaavat."KortteliAlue"."YhteensaKm2" IS 'Kerrosneliömetrit yhteensä';
-- ddl-end --
COMMENT ON COLUMN asemakaavat."KortteliAlue"."KaytettyKm2" IS 'Käytetyt kerrosneliömetrit';
-- ddl-end --
COMMENT ON COLUMN asemakaavat."KortteliAlue"."PintaAla" IS 'Pinta-ala';
-- ddl-end --
COMMENT ON COLUMN asemakaavat."KortteliAlue"."Lisatietoja" IS 'Lisätietoja';
-- ddl-end --
COMMENT ON COLUMN asemakaavat."KortteliAlue"."LuontiPVM" IS 'Luonti päivämäärä';
-- ddl-end --
COMMENT ON COLUMN asemakaavat."KortteliAlue"."DatanLuoja" IS 'Datan luoja';
-- ddl-end --
COMMENT ON COLUMN asemakaavat."KortteliAlue"."MuokkausPVM" IS 'Muokkaus päivämäärä';
-- ddl-end --
COMMENT ON COLUMN asemakaavat."KortteliAlue"."DatanMuokkaaja" IS 'Datan muokkaaja';
-- ddl-end --
COMMENT ON COLUMN asemakaavat."KortteliAlue"."HistoriaPVM" IS 'Hisotoria päivämäärä (???)';
-- ddl-end --
ALTER TABLE asemakaavat."KortteliAlue" OWNER TO postgres;
-- ddl-end --

-- object: "KortteliAlue_fk" | type: CONSTRAINT --
-- ALTER TABLE asemakaavat."Tontti" DROP CONSTRAINT IF EXISTS "KortteliAlue_fk" CASCADE;
ALTER TABLE asemakaavat."Tontti" ADD CONSTRAINT "KortteliAlue_fk" FOREIGN KEY ("Korttelialue_uuid_KortteliAlue")
REFERENCES asemakaavat."KortteliAlue" ("Korttelialue_uuid") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "Asemakaava_fk" | type: CONSTRAINT --
-- ALTER TABLE asemakaavat."KaavaMaarays" DROP CONSTRAINT IF EXISTS "Asemakaava_fk" CASCADE;
ALTER TABLE asemakaavat."KaavaMaarays" ADD CONSTRAINT "Asemakaava_fk" FOREIGN KEY ("Asemakaava__uuid_Asemakaava")
REFERENCES asemakaavat."Asemakaava" ("Asemakaava__uuid") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "Asemakaava_fk" | type: CONSTRAINT --
-- ALTER TABLE asemakaavat."KortteliAlue" DROP CONSTRAINT IF EXISTS "Asemakaava_fk" CASCADE;
ALTER TABLE asemakaavat."KortteliAlue" ADD CONSTRAINT "Asemakaava_fk" FOREIGN KEY ("Asemakaava__uuid_Asemakaava")
REFERENCES asemakaavat."Asemakaava" ("Asemakaava__uuid") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "Asemakaava_fk" | type: CONSTRAINT --
-- ALTER TABLE asemakaavat."YleinenAlue_MuuAlue" DROP CONSTRAINT IF EXISTS "Asemakaava_fk" CASCADE;
ALTER TABLE asemakaavat."YleinenAlue_MuuAlue" ADD CONSTRAINT "Asemakaava_fk" FOREIGN KEY ("Asemakaava__uuid_Asemakaava")
REFERENCES asemakaavat."Asemakaava" ("Asemakaava__uuid") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: koodistot."AK_tyyppi" | type: TABLE --
-- DROP TABLE IF EXISTS koodistot."AK_tyyppi" CASCADE;
CREATE TABLE koodistot."AK_tyyppi"(
	"AK_tunniste" varchar(10) NOT NULL,
	"AK_selite" varchar(200),
	CONSTRAINT "AK_tyyppi_pk" PRIMARY KEY ("AK_tunniste")

);
-- ddl-end --
ALTER TABLE koodistot."AK_tyyppi" OWNER TO postgres;
-- ddl-end --

INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'A', E'Asuinrakennusten korttelialue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'AK', E'Asuinkerrostalojen korttelialue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'AS', E'Asuntolarakennusten korttelialue');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'AP', E'Asuinpientalojen korttelialue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'AR', E'Rivitalojen ja muiden kytkettyjen asuinrakennusten korttelialue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'AO', E'Erillispientalojen korttelialue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'AL', E'Asuin-, liike- ja toimistorakennusten korttelialue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'AH', E'Asumista palveleva yhteiskäyttöinen korttelialue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'AM', E'Maatilojen talouskeskusten korttelialue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'P', E'Palvelurakennusten korttelialue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'PL', E'Lähipalvelurakennusten korttelialue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'PV', E'Huvi- ja viihdepalvelujen korttelialue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'Y', E'Yleisten rakennusten korttelialue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'YL', E'Julkisten lähipalvelurakennusten korttelialue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'YH', E'Hallinto- ja virastorakennusten korttelialue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'YO', E'Opetustoimintaa palvelevien rakennusten korttelialue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'YS', E'Sosiaalitointa ja terveydenhuoltoa palvelevien rakennusten korttelialue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'YY', E'Kulttuuritoimintaa palvelevien rakennusten korttelialue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'YM', E'Museorakennusten korttelialue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'YK', E'Kirkkojen ja muiden seurakunnallistenrakennusten korttelialue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'YU', E'Urheilutoimintaa palvelevien rakennusten korttelialue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'C', E'Keskustatoimintojen korttelialue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'K', E'Liike- ja toimistorakennusten korttelialue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'KL', E'Liikerakennusten korttelialue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'KM', E'Liikerakennusten korttelialue, jolle saa sijoittaa vähittäiskaupan suuryksikön.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'KT', E'Toimistorakennusten korttelialue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'KTY', E'Toimitilarakennusten korttelialue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'T', E'Teollisuus- ja varastorakennusten korttelialue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'TT', E'Teollisuusrakennusten korttelialue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'TV', E'Varastorakennusten korttelialue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'TY', E'Teollisuusrakennusten korttelialue, jolla ympäristö asettaa toiminnan laadulle erityisiä vaatimuksia.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'T/kem', E'Teollisuus- ja varastorakennusten korttelialue, jolla on/jolle saa sijoittaa merkittävän, vaarallisia kemikaaleja valmistavan tai varastoivan laitoksen.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'V', E'Virkistysalue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'VP', E'Puisto.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'VL', E'Lähivirkistysalue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'VK', E'Leikkipuisto.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'VU', E'Urheilu- ja virkistyspalvelujen alue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'VR', E'Retkeily- ja ulkoilualue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'VV', E'Uimaranta-alue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'R', E'Loma- ja matkailualue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'RA', E'Loma-asuntojen korttelialue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'RM', E'Matkailua palvelevien rakennusten korttelialue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'RL', E'Leirintäalue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'RV', E'Asuntovaunualue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'RP', E'Siirtolapuutarha-/palstaviljelyalue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'L', E'Liikennealue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'LT', E'Yleisen tien alue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'LR', E'Rautatiealue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'LL', E'Lentokenttäalue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'LS', E'Satama-alue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'LK', E'Kanava-alue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'LV', E'Venesatama/venevalkama.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'LP', E'Yleinen pysäköintialue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'LH', E'Huoltoaseman korttelialue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'LHA', E'Henkilöliikenneterminaalin korttelialue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'LTA', E'Tavaraliikenneterminaalin korttelialue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'LPY', E'Yleisten pysäköintilaitosten korttelialue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'LPA', E'Autopaikkojen korttelialue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'E', E'Erityisalue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'ET', E'Yhdyskuntateknistä huoltoa palvelevien rakennusten ja laitosten alue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'EN', E'Energiahuollon alue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'EJ', E'Jätteenkäsittelyalue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'EO', E'Maa-ainesten ottoalue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'EK', E'Kaivosalue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'EMT', E'Mastoalue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'EA', E'Ampumarata-alue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'EP', E'Puolustusvoimien alue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'EH', E'Hautausmaa-alue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'EV', E'Suojaviheralue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'S', E'Suojelualue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'SL', E'Luonnonsuojelualue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'SM', E'Muinaismuistoalue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'SR', E'Rakennussuojelualue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'M', E'Maa- ja metsätalousalue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'MT', E'Maatalousalue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'ME', E'Kotieläintalouden suuryksikön alue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'MP', E'Puutarha- ja kasvihuonealue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'MA', E'Maisemallisesti arvokas peltoalue.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'MU', E'Maa- ja metsätalousalue, jolla on erityistä ulkoilun ohjaamistarvetta.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'MY', E'Maa- ja metsätalousalue, jolla on erityisiä ympäristöarvoja.');
-- ddl-end --
INSERT INTO koodistot."AK_tyyppi" ("AK_tunniste", "AK_selite") VALUES (E'W', E'Vesialue.');
-- ddl-end --

-- object: asemakaavat."Rakennusala" | type: TABLE --
-- DROP TABLE IF EXISTS asemakaavat."Rakennusala" CASCADE;
CREATE TABLE asemakaavat."Rakennusala"(
	gid serial,
	geom geometry(MULTISURFACEZ, 3878),
	"Rakennusala_uuid" uuid NOT NULL,
	"Tyyppi" varchar,
	"KohteenVaihe" smallint,
	"Tehokkuusluku" real,
	"Km2" real,
	"LisaKm2" real,
	"LisaKm2Kuvaus" varchar(200),
	"KaytettyKm2" real,
	"Poistettava" boolean,
	"Maanalainen" boolean,
	"Lisatietoja" varchar(200),
	"Varisavy" smallint,
	"Sitova" boolean DEFAULT True,
	"Kellari" real,
	"Kerrosluku" smallint,
	"Ullakko" real,
	"PintaAla" real,
	"LuontiPVM" date,
	"DatanLuoja" varchar(50),
	"MuokkausPVM" date,
	"DatanMuokkaaja" varchar(50),
	"HistoriaPVM" date,
	"DatanOmistaja" varchar(50),
	"Asemakaava__uuid_Asemakaava" uuid,
	CONSTRAINT rakennusala_uuid_pk PRIMARY KEY ("Rakennusala_uuid")

);
-- ddl-end --
ALTER TABLE asemakaavat."Rakennusala" OWNER TO postgres;
-- ddl-end --

-- object: "Asemakaava_fk" | type: CONSTRAINT --
-- ALTER TABLE asemakaavat."Rakennusala" DROP CONSTRAINT IF EXISTS "Asemakaava_fk" CASCADE;
ALTER TABLE asemakaavat."Rakennusala" ADD CONSTRAINT "Asemakaava_fk" FOREIGN KEY ("Asemakaava__uuid_Asemakaava")
REFERENCES asemakaavat."Asemakaava" ("Asemakaava__uuid") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: asemakaavat."YmparistoAlue" | type: TABLE --
-- DROP TABLE IF EXISTS asemakaavat."YmparistoAlue" CASCADE;
CREATE TABLE asemakaavat."YmparistoAlue"(
	gid serial,
	geom geometry(MULTISURFACEZ, 3878),
	"YmparistoAlue_uuid" uuid NOT NULL,
	"Tyyppi" varchar,
	"KohteenVaihe" smallint,
	"Poistettava" boolean,
	"Lisatietoja" varchar(200),
	"Sitova" boolean,
	"PintaAla" real,
	"LuontiPVM" date,
	"DatanLuoja" varchar(50),
	"MuokkausPVM" date,
	"DatanMuokkaaja" varchar(50),
	"HistoriaPVM" date,
	"DatanOmistaja" varchar(50),
	"Asemakaava__uuid_Asemakaava" uuid,
	CONSTRAINT ymparistoalue_uuid_pk PRIMARY KEY ("YmparistoAlue_uuid")

);
-- ddl-end --
ALTER TABLE asemakaavat."YmparistoAlue" OWNER TO postgres;
-- ddl-end --

-- object: "Asemakaava_fk" | type: CONSTRAINT --
-- ALTER TABLE asemakaavat."YmparistoAlue" DROP CONSTRAINT IF EXISTS "Asemakaava_fk" CASCADE;
ALTER TABLE asemakaavat."YmparistoAlue" ADD CONSTRAINT "Asemakaava_fk" FOREIGN KEY ("Asemakaava__uuid_Asemakaava")
REFERENCES asemakaavat."Asemakaava" ("Asemakaava__uuid") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Rakennusala_fk" | type: CONSTRAINT --
-- ALTER TABLE asemakaavat."KaavaMaarays" DROP CONSTRAINT IF EXISTS "Rakennusala_fk" CASCADE;
ALTER TABLE asemakaavat."KaavaMaarays" ADD CONSTRAINT "Rakennusala_fk" FOREIGN KEY ("Rakennusala_uuid_Rakennusala")
REFERENCES asemakaavat."Rakennusala" ("Rakennusala_uuid") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "YmparistoAlue_fk" | type: CONSTRAINT --
-- ALTER TABLE asemakaavat."KaavaMaarays" DROP CONSTRAINT IF EXISTS "YmparistoAlue_fk" CASCADE;
ALTER TABLE asemakaavat."KaavaMaarays" ADD CONSTRAINT "YmparistoAlue_fk" FOREIGN KEY ("YmparistoAlue_uuid_YmparistoAlue")
REFERENCES asemakaavat."YmparistoAlue" ("YmparistoAlue_uuid") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "AK_tyyppi_fk" | type: CONSTRAINT --
-- ALTER TABLE asemakaavat."YleinenAlue_MuuAlue" DROP CONSTRAINT IF EXISTS "AK_tyyppi_fk" CASCADE;
ALTER TABLE asemakaavat."YleinenAlue_MuuAlue" ADD CONSTRAINT "AK_tyyppi_fk" FOREIGN KEY ("AK_tunniste_AK_tyyppi")
REFERENCES koodistot."AK_tyyppi" ("AK_tunniste") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "YleinenAlue_MuuAlue_uq" | type: CONSTRAINT --
-- ALTER TABLE asemakaavat."YleinenAlue_MuuAlue" DROP CONSTRAINT IF EXISTS "YleinenAlue_MuuAlue_uq" CASCADE;
ALTER TABLE asemakaavat."YleinenAlue_MuuAlue" ADD CONSTRAINT "YleinenAlue_MuuAlue_uq" UNIQUE ("AK_tunniste_AK_tyyppi");
-- ddl-end --

-- object: koodistot.ra_tyyppi | type: TABLE --
-- DROP TABLE IF EXISTS koodistot.ra_tyyppi CASCADE;
CREATE TABLE koodistot.ra_tyyppi(
	id serial NOT NULL,
	ra_tyyppi_uuid uuid,
	nimi varchar(254),
	lyhenne varchar(5),
	"Rakennusala_uuid_Rakennusala" uuid,
	CONSTRAINT id_pk PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE koodistot.ra_tyyppi IS 'Rakennusalan tyyppi';
-- ddl-end --
COMMENT ON COLUMN koodistot.ra_tyyppi.ra_tyyppi_uuid IS 'Rakennusalan tyypin yksilöivä tunnus';
-- ddl-end --
COMMENT ON COLUMN koodistot.ra_tyyppi.nimi IS 'Rakennusalan tyypin nimi';
-- ddl-end --
COMMENT ON COLUMN koodistot.ra_tyyppi.lyhenne IS 'Rakennusalan tyypin lyhenne';
-- ddl-end --
ALTER TABLE koodistot.ra_tyyppi OWNER TO postgres;
-- ddl-end --

INSERT INTO koodistot.ra_tyyppi (id, nimi, lyhenne) VALUES (DEFAULT, E'Rakennusala', DEFAULT);
-- ddl-end --
INSERT INTO koodistot.ra_tyyppi (id, nimi, lyhenne) VALUES (DEFAULT, E'Rakennusala_I_', DEFAULT);
-- ddl-end --
INSERT INTO koodistot.ra_tyyppi (id, nimi, lyhenne) VALUES (DEFAULT, E'Rakennusala, jolle saa sijoittaa päiväkodin', E'pk');
-- ddl-end --
INSERT INTO koodistot.ra_tyyppi (id, nimi, lyhenne) VALUES (DEFAULT, E'Rakennusala, jolle saa sijoittaa myymälän', E'm');
-- ddl-end --
INSERT INTO koodistot.ra_tyyppi (id, nimi, lyhenne) VALUES (DEFAULT, E'Rakennusala, jolle saa sijoittaa maatilan talouskeskuksen', DEFAULT);
-- ddl-end --
INSERT INTO koodistot.ra_tyyppi (id, nimi, lyhenne) VALUES (DEFAULT, E'Rakennusala, jolle saa sijoittaa talousrakennuksen', E't');
-- ddl-end --
INSERT INTO koodistot.ra_tyyppi (id, nimi, lyhenne) VALUES (DEFAULT, E'Rakennusalal, jolla saa sijoittaa polttoaineen jakeluaseman', DEFAULT);
-- ddl-end --
INSERT INTO koodistot.ra_tyyppi (id, nimi, lyhenne) VALUES (DEFAULT, E'Auton säilytyspaikan rakennusala', E'a');
-- ddl-end --
INSERT INTO koodistot.ra_tyyppi (id, nimi, lyhenne) VALUES (DEFAULT, E'Uloke', E'u');
-- ddl-end --
INSERT INTO koodistot.ra_tyyppi (id, nimi, lyhenne) VALUES (DEFAULT, E'Rakennukseen jätettävä kulkuaukko', DEFAULT);
-- ddl-end --
INSERT INTO koodistot.ra_tyyppi (id, nimi, lyhenne) VALUES (DEFAULT, E'Valokatteinen tila', E'v');
-- ddl-end --
INSERT INTO koodistot.ra_tyyppi (id, nimi, lyhenne) VALUES (DEFAULT, E'Leikki/oleskelualueeksi varattu alue', E'le');
-- ddl-end --
INSERT INTO koodistot.ra_tyyppi (id, nimi, lyhenne) VALUES (DEFAULT, E'Pysäköimispaikka', E'lp');
-- ddl-end --
INSERT INTO koodistot.ra_tyyppi (id, nimi, lyhenne) VALUES (DEFAULT, E'Suojeltu rakennus', E'sr');
-- ddl-end --
INSERT INTO koodistot.ra_tyyppi (id, nimi, lyhenne) VALUES (DEFAULT, E'Maanalainen tila', E'ma');
-- ddl-end --

-- object: "Rakennusala_fk" | type: CONSTRAINT --
-- ALTER TABLE koodistot.ra_tyyppi DROP CONSTRAINT IF EXISTS "Rakennusala_fk" CASCADE;
ALTER TABLE koodistot.ra_tyyppi ADD CONSTRAINT "Rakennusala_fk" FOREIGN KEY ("Rakennusala_uuid_Rakennusala")
REFERENCES asemakaavat."Rakennusala" ("Rakennusala_uuid") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: ra_tyyppi_uq | type: CONSTRAINT --
-- ALTER TABLE koodistot.ra_tyyppi DROP CONSTRAINT IF EXISTS ra_tyyppi_uq CASCADE;
ALTER TABLE koodistot.ra_tyyppi ADD CONSTRAINT ra_tyyppi_uq UNIQUE ("Rakennusala_uuid_Rakennusala");
-- ddl-end --

-- object: koodistot."AK_luokka" | type: TABLE --
-- DROP TABLE IF EXISTS koodistot."AK_luokka" CASCADE;
CREATE TABLE koodistot."AK_luokka"(
	"AK_tunniste" varchar(10) NOT NULL,
	"AK_selite" varchar,
	CONSTRAINT "AK_luokka_pk" PRIMARY KEY ("AK_tunniste")

);
-- ddl-end --
ALTER TABLE koodistot."AK_luokka" OWNER TO postgres;
-- ddl-end --

INSERT INTO koodistot."AK_luokka" ("AK_tunniste", "AK_selite") VALUES (E'A', E'Asuinrakennusten korttelialue');
-- ddl-end --
INSERT INTO koodistot."AK_luokka" ("AK_tunniste", "AK_selite") VALUES (E'P', E'Palvelurakennusten korttelialue');
-- ddl-end --
INSERT INTO koodistot."AK_luokka" ("AK_tunniste", "AK_selite") VALUES (E'Y', E'Yleisten rakennusten korttelialue');
-- ddl-end --
INSERT INTO koodistot."AK_luokka" ("AK_tunniste", "AK_selite") VALUES (E'C', E'Keskustatoimintojen korttelialue');
-- ddl-end --
INSERT INTO koodistot."AK_luokka" ("AK_tunniste", "AK_selite") VALUES (E'K', E'Liike-ja toimistorakennusten korttelialue');
-- ddl-end --
INSERT INTO koodistot."AK_luokka" ("AK_tunniste", "AK_selite") VALUES (E'T', E'Teollisuus- ja varastorakennusten korttelialue');
-- ddl-end --
INSERT INTO koodistot."AK_luokka" ("AK_tunniste", "AK_selite") VALUES (E'V', E'Virkistysalue');
-- ddl-end --
INSERT INTO koodistot."AK_luokka" ("AK_tunniste", "AK_selite") VALUES (E'R', E'Loma- ja matkailualue');
-- ddl-end --
INSERT INTO koodistot."AK_luokka" ("AK_tunniste", "AK_selite") VALUES (E'L', E'Liikennealue');
-- ddl-end --
INSERT INTO koodistot."AK_luokka" ("AK_tunniste", "AK_selite") VALUES (E'E', E'Erityisalue');
-- ddl-end --
INSERT INTO koodistot."AK_luokka" ("AK_tunniste", "AK_selite") VALUES (E'S', E'Suojelualue');
-- ddl-end --
INSERT INTO koodistot."AK_luokka" ("AK_tunniste", "AK_selite") VALUES (E'M', E'Maa- ja metsätalousalue');
-- ddl-end --
INSERT INTO koodistot."AK_luokka" ("AK_tunniste", "AK_selite") VALUES (E'W', E'Vesialue');
-- ddl-end --

-- object: "AK_tyyppi_fk" | type: CONSTRAINT --
-- ALTER TABLE asemakaavat."KortteliAlue" DROP CONSTRAINT IF EXISTS "AK_tyyppi_fk" CASCADE;
ALTER TABLE asemakaavat."KortteliAlue" ADD CONSTRAINT "AK_tyyppi_fk" FOREIGN KEY ("AK_tunniste_AK_tyyppi")
REFERENCES koodistot."AK_tyyppi" ("AK_tunniste") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "KortteliAlue_uq" | type: CONSTRAINT --
-- ALTER TABLE asemakaavat."KortteliAlue" DROP CONSTRAINT IF EXISTS "KortteliAlue_uq" CASCADE;
ALTER TABLE asemakaavat."KortteliAlue" ADD CONSTRAINT "KortteliAlue_uq" UNIQUE ("AK_tunniste_AK_tyyppi");
-- ddl-end --

-- object: "AK_luokka_fk" | type: CONSTRAINT --
-- ALTER TABLE asemakaavat."YleinenAlue_MuuAlue" DROP CONSTRAINT IF EXISTS "AK_luokka_fk" CASCADE;
ALTER TABLE asemakaavat."YleinenAlue_MuuAlue" ADD CONSTRAINT "AK_luokka_fk" FOREIGN KEY ("AK_tunniste_AK_luokka")
REFERENCES koodistot."AK_luokka" ("AK_tunniste") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "YleinenAlue_MuuAlue_uq1" | type: CONSTRAINT --
-- ALTER TABLE asemakaavat."YleinenAlue_MuuAlue" DROP CONSTRAINT IF EXISTS "YleinenAlue_MuuAlue_uq1" CASCADE;
ALTER TABLE asemakaavat."YleinenAlue_MuuAlue" ADD CONSTRAINT "YleinenAlue_MuuAlue_uq1" UNIQUE ("AK_tunniste_AK_luokka");
-- ddl-end --

-- object: "AK_luokka_fk" | type: CONSTRAINT --
-- ALTER TABLE asemakaavat."KortteliAlue" DROP CONSTRAINT IF EXISTS "AK_luokka_fk" CASCADE;
ALTER TABLE asemakaavat."KortteliAlue" ADD CONSTRAINT "AK_luokka_fk" FOREIGN KEY ("AK_tunniste_AK_luokka")
REFERENCES koodistot."AK_luokka" ("AK_tunniste") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "KortteliAlue_uq1" | type: CONSTRAINT --
-- ALTER TABLE asemakaavat."KortteliAlue" DROP CONSTRAINT IF EXISTS "KortteliAlue_uq1" CASCADE;
ALTER TABLE asemakaavat."KortteliAlue" ADD CONSTRAINT "KortteliAlue_uq1" UNIQUE ("AK_tunniste_AK_luokka");
-- ddl-end --


