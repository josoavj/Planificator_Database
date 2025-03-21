DROP TABLE IF EXISTS Planning;
DROP TABLE IF EXISTS Remarque;

-- Pour la table planning
CREATE TABLE PlanificationMensuelle (
    planification_id INT PRIMARY KEY AUTO_INCREMENT,
    traitement_id INT NOT NULL,
    date_planifiee DATE NOT NULL,
    statut ENUM('Planifié', 'Effectué', 'Décalé', 'Annulé') DEFAULT 'Planifié',
    FOREIGN KEY (traitement_id) REFERENCES Traitement(traitement_id) ON DELETE CASCADE
);

-- Pour la table remarque
CREATE TABLE Remarque (
    remarque_id INT PRIMARY KEY AUTO_INCREMENT,
    planification_id INT NOT NULL,
    client_id INT NOT NULL,
    contenu TEXT NOT NULL,
    date_remarque TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (planification_id) REFERENCES PlanificationMensuelle(planification_id) ON DELETE CASCADE,
    FOREIGN KEY (client_id) REFERENCES Client(client_id) ON DELETE CASCADE
);