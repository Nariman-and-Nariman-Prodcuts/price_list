CREATE TABLE hsn (
    id int NOT NULL AUTO_INCREMENT,
    four_digit varchar(4) NOT NULL,
    eight_digit varchar(8),
    description varchar(255),
    PRIMARY KEY (id)
);

CREATE TABLE uqc (
    id int NOT NULL AUTO_INCREMENT,
    qty varchar(255),
    type varchar(255),
    uqc varchar(255),
    PRIMARY KEY (id)
);

CREATE TABLE pos (
    id int NOT NULL AUTO_INCREMENT,
    state varchar(255),
    pos varchar(2),
    pos_name varchar(255),
    PRIMARY KEY (id)
);  

CREATE TABLE tax (
    id int NOT NULL AUTO_INCREMENT,
    tax_name varchar(255),
    sgst DECIMAL(10),
    cgst DECIMAL(10),
    igst DECIMAL(10),
    kfc DECIMAL(10),
    PRIMARY KEY (id)
);  

CREATE TABLE pdt (
    id int NOT NULL AUTO_INCREMENT,
    status varchar(255),
    sku varchar(255),
    hsn_id INT,
    uqc_id INT,
    tax_id INT,
    brand varchar(255),
    product varchar(255),
    varitaion varchar(255),
    pack_style varchar(255),
    qty DECIMAL(10),
    qty_unit varchar(255),
    mrp DECIMAL(10),
    PRIMARY KEY (id),
    CONSTRAINT fk_hsn FOREIGN KEY (hsn_id) REFERENCES hsn(id),
    CONSTRAINT fk_uqc FOREIGN KEY (uqc_id) REFERENCES uqc(id),
    CONSTRAINT fk_tax FOREIGN KEY (tax_id) REFERENCES tax(id)
);  

CREATE TABLE slab (
    id int NOT NULL AUTO_INCREMENT,
    pdt_id INT,
    slab varchar(255),
    margin DECIMAL(10),
    PRIMARY KEY (id),
    CONSTRAINT fk_pdt FOREIGN KEY (pdt_id) REFERENCES pdt(id)
);  

CREATE TABLE cust (
    id int NOT NULL AUTO_INCREMENT,
    cust_name varchar(255),
    gstin varchar(255),
    pos_id int,
    slab_id int,
    bill_add_line1 varchar(255),
    bill_add_line2 varchar(255),
    bill_add_city varchar(255),
    bill_add_district varchar(255),
    bill_add_state varchar(255),
    bill_add_pincode varchar(255),
    bill_add_phone1 varchar(255),
    bill_add_phone2 varchar(255),
    bill_add_email varchar(255),
    ship_add_line1 varchar(255),
    ship_add_line2 varchar(255),
    ship_add_city varchar(255),
    ship_add_district varchar(255),
    ship_add_state varchar(255),
    ship_add_pincode varchar(255),
    ship_add_phone1 varchar(255),
    ship_add_phone2 varchar(255),
    ship_add_email varchar(255),
    PRIMARY KEY (id),
    CONSTRAINT fk_pos FOREIGN KEY (pos_id) REFERENCES pos(id),
    CONSTRAINT fk_slab FOREIGN KEY (slab_id) REFERENCES slab(id)
);  

CREATE TABLE invoice (
    id int NOT NULL AUTO_INCREMENT,
    invoice_no varchar(255),
    invoice_date varchar(255),
    cust_id int,
    taxable_value DECIMAL(10),
    sgst DECIMAL(10),
    cgst DECIMAL(10),
    igst DECIMAL(10),
    kfc DECIMAL(10),
    total_tax DECIMAL(10),
    total_invoice_value DECIMAL(10),
    round_off DECIMAL(10),
    total_invoice_value_pay DECIMAL(10),
    PRIMARY KEY (id),
    CONSTRAINT fk_cust FOREIGN KEY (cust_id) REFERENCES cust(id),
);

CREATE TABLE invoice_details (
    id int NOT NULL AUTO_INCREMENT,
    invoice_id int,
    pdt_id int,
    qty int,
    net_amt DECIMAL(10),
    sgst_amt DECIMAL(10),
    cgst_amt DECIMAL(10),
    igst_amt DECIMAL(10),
    kfc_amt DECIMAL(10),
    PRIMARY KEY (id),
    CONSTRAINT fk_invoice FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    CONSTRAINT fk_pdt FOREIGN KEY (pdt_id) REFERENCES pdt(id),
);  
