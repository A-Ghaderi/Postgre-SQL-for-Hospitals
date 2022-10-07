CREATE OR REPLACE FUNCTION f_mask_field(field text)
	RETURNS text
	LANGUAGE plpgsql
	AS $$
	BEGIN
		IF field is null THEN
			RETURN null;
		ELSE
			RETURN concat('Patient ', LEFT(md5(field),8));
		END IF;
	END;
	$$;
	