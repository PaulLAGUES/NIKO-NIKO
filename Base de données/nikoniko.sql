Drop database if exists nikoniko;
create database nikoniko;
Use nikoniko;

Drop table if exists agence;
Create table agence (
    id_agen     int auto_increment not null,
    nom_agen    varchar (15),
    primary key (id_agen)
)ENGINE=InnoDB;

Drop table if exists verticale;
Create table verticale (
    id_vert     int auto_increment not null,
    nom_vert    varchar (20),
    id_agen     int not null,
    primary key (id_vert)
)ENGINE=InnoDB;

Drop table if exists equipe;
Create table equipe (
    id_equ      int auto_increment not null,
    nom_equ     varchar (20),
    id_vert     int not null,
    primary key (id_equ)
)ENGINE=InnoDB;

Drop table if exists utilisateur;
Create table utilisateur (
    id_util             int auto_increment not null,
    nom_util            varchar (20),
    prenom_util         varchar (20),
    role_util           varchar (20),
    matricule_cgi_util  varchar (20),
    primary key         (id_util)
)ENGINE=InnoDB;

Drop table if exists satisfaction;
Create table satisfaction (
    id_sat      int auto_increment not null,
    date_sat    date,
    humeur_sat  varchar (20),
    com_sat    varchar (200),
    id_util     int not null,
    primary key (id_sat)
)ENGINE=InnoDB;

Drop table if exists faireparti;
Create table faireparti (
    id_equ      int not null,
    id_util     int not null
)ENGINE=InnoDB;

Alter table verticale add constraint fk_verticale_id_agen foreign key (id_agen) references agence(id_agen);
Alter table equipe add constraint fk_equipe_id_vert foreign key (id_vert) references verticale(id_vert);
Alter table satisfaction add constraint fk_satisfaction_id_util foreign key (id_util) references utilisateur(id_util);
Alter table faireparti add constraint fk_faireparti_id_equ foreign key (id_equ) references equipe(id_equ);
Alter table faireparti add constraint fk_faireparti_id_util foreign key (id_util) references utilisateur(id_util);
