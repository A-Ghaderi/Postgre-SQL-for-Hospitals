CREATE FUNCTION f_mask_field(field text)
	RETURNS text
	LANGUAGE plpgsql
	AS $$
	BEGIN
		RETURN md5(field);
	END;
	$$;
