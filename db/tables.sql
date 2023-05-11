\connect db
CREATE TABLE IF NOT EXISTS roles (
	id serial primary key,
	name VARCHAR(125) not null,
	access VARCHAR(10) not null
);
comment on column roles.access is 'optional for customizing several actions types';

CREATE TABLE IF NOT EXISTS users (
  id serial primary key,
  name VARCHAR(125) not null,
  pass VARCHAR(256) not null,
  roles_id INT not null,
  CONSTRAINT fk_users_roles
    FOREIGN KEY (roles_id)
    	REFERENCES roles(id)
    		ON DELETE CASCADE
    		ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS absence (
  id serial primary key,
  status VARCHAR(45) NOT NULL DEFAULT 'pending',
  fulfilled BOOLEAN NOT NULL DEFAULT false,
  date DATE NOT NULL default CURRENT_DATE,
  users_id INT NOT NULL,
  CONSTRAINT fk_absence_users
    FOREIGN KEY (users_id)
    	REFERENCES users(id)
    		ON DELETE CASCADE
    		ON UPDATE CASCADE
);
	comment on column absence.status is 'pending|granted|denied, could also be linked to a status table for posible predefined status...';
	comment on column absence.fulfilled is 'user took absence (maybe there is a posibility that this absence could be granted but not taken )';

CREATE TABLE IF NOT EXISTS history (
  id serial primary key,
  status VARCHAR(45) NOT NULL,  
  fulfilled BOOLEAN NOT NULL,  
  date DATE NOT NULL,
  users_id INT NOT NULL,
  CONSTRAINT fk_history_users1
    FOREIGN KEY (users_id)
    	REFERENCES users(id)
    		ON DELETE NO ACTION
    		ON UPDATE CASCADE
);
comment on column history.status is 'pending|granted|denied, could also be linked to a status table for posible predefined status...';
comment on column history.fulfilled is 'user took absence (maybe there is a posibility that this absence could be granted but not taken )';
