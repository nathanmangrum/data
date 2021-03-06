CREATE TABLE serviceprovider (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  name character varying (50) NOT NULL DEFAULT(''),
  address character varying (50) NOT NULL DEFAULT(''),
  city character varying (25) NOT NULL DEFAULT(''),
  zip int NOT NULL DEFAULT(''),
  services character varying (250) NOT NULL DEFAULT(''),
  CONSTRAINT spprimary PRIMARY KEY(id),
  FOREIGN KEY(services) REFERENCES services(id)
);

-- we can start inserting things below here
