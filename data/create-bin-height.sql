create table bin_height 
(
    bin integer
   ,height_roof float
);
\copy bin_height (BIN, HEIGHT_ROOF) FROM 'bin_height.csv' DELIMITER ',' CSV HEADER;