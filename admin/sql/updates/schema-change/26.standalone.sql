-- Generated by CompileSchemaScripts.pl from:
-- 20201028-mbs-1424-fks.sql
-- 20210319-mbs-10647.sql
-- 20210319-mbs-11451-standalone.sql
\set ON_ERROR_STOP 1
BEGIN;
SET search_path = musicbrainz, public;
SET LOCAL statement_timeout = 0;
--------------------------------------------------------------------------------
SELECT '20201028-mbs-1424-fks.sql';

SET search_path = musicbrainz;


ALTER TABLE release_first_release_date
   ADD CONSTRAINT release_first_release_date_fk_release
   FOREIGN KEY (release)
   REFERENCES release(id)
   ON DELETE CASCADE;

ALTER TABLE recording_first_release_date
  ADD CONSTRAINT recording_first_release_date_fk_recording
  FOREIGN KEY (recording)
  REFERENCES recording(id)
  ON DELETE CASCADE;

--------------------------------------------------------------------------------
SELECT '20210319-mbs-10647.sql';

DROP TRIGGER IF EXISTS b_del_label_special ON label;

CREATE TRIGGER b_del_label_special BEFORE DELETE ON label
    FOR EACH ROW WHEN (OLD.id IN (1, 3267)) EXECUTE PROCEDURE deny_special_purpose_deletion();

--------------------------------------------------------------------------------
SELECT '20210319-mbs-11451-standalone.sql';

DROP TRIGGER IF EXISTS a_ins_place ON place;

CREATE TRIGGER a_ins_place AFTER INSERT ON place
    FOR EACH ROW EXECUTE PROCEDURE a_ins_place();

COMMIT;
