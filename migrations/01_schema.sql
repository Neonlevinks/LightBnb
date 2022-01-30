CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL
);

CREATE TABLE properties (
  id SERIAL PRIMARY KEY,
  owner_id INTEGER,
  title VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  thumbnail VARCHAR(255) NOT NULL,
  cover_photo_url VARCHAR(255) NOT NULL,
  cost_per_night INTEGER NOT NULL,
  parking_spaces INTEGER,
  number_of_bathrooms INTEGER,
  number_of_bedrooms INTEGER,
  country VARCHAR(255) NOT NULL,
  street VARCHAR(255) NOT NULL,
  province VARCHAR(255) NOT NULL,
  post_code VARCHAR(255) NOT NULL,
  active BOOLEAN
);

CREATE TABLE reservations (
  id SERIAL PRIMARY KEY,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  property_id INTEGER REFERENCES properties.id,
  guest_id INTEGER REFERENCES guests.id
);

CREATE TABLE property_reviews(
  id SERIAL PRIMARY KEY,
  guest_id INTEGER REFERENCES users.id,
  property_id INTEGER REFERENCES properties.id,
  reservation_id INTEGER REFERENCES reservation.id,
  rating SMALLINT NOT NULL,
  message TEXT,
)