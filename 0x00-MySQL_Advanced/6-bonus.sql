DELIMITER //

CREATE PROCEDURE AddBonus(
    IN p_user_id INT,
    IN p_project_name VARCHAR(255),
    IN p_score DECIMAL(10, 2)
)
BEGIN
    DECLARE project_id INT;
    
    -- Check if the project already exists in the projects table
    SELECT id INTO project_id FROM projects WHERE name = p_project_name;
    
    -- If the project doesn't exist, create it and get its ID
    IF project_id IS NULL THEN
        INSERT INTO projects (name) VALUES (p_project_name);
        SET project_id = LAST_INSERT_ID();
    END IF;
    
    -- Insert the new correction for the student
    INSERT INTO corrections (user_id, project_id, score) VALUES (p_user_id, project_id, p_score);
END//

DELIMITER ;
