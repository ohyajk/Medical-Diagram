CREATE TABLE patients (id SERIAL PRIMARY KEY, name TEXT, date_of_birth DATE);

CREATE TABLE medical_histories (id SERIAL PRIMARY KEY,admitted_at TIMESTAMP, patient_id INTEGER, FOREIGN KEY (patient_id) REFERENCES patients(id),status VARCHAR(20));

CREATE TABLE treatments (id SERIAL PRIMARY KEY, type VARCHAR(20), name VARCHAR(20));

CREATE TABLE invoices (id SERIAL PRIMARY KEY, total_amount DECIMAL, generated_at TIMESTAMP, payed_at TIMESTAMP, medical_history_id INTEGER, FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id));

CREATE TABLE invoice_items (id SERIAL PRIMARY KEY, unit_price DECIMAL, quantity INTEGER, total_price DECIMAL, invoice_id INTEGER, FOREIGN KEY (invoice_id) REFERENCES invoices(id), treatment_id INTEGER);

-- Add Foreign Keys

ALTER TABLE invoice_items ADD FOREIGN KEY (treatment_id) REFERENCES treatments(id);

--  Create join table
create table medical_history_treatments ( medical_history_id int, treatment_id int, primary key(medical_history_id, treatment_id));

ALTER TABLE medical_history_treatments ADD FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id);

ALTER TABLE medical_history_treatments ADD FOREIGN KEY (treatment_id) REFERENCES treatments(id);