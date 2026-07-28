<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20260728211253 extends AbstractMigration
{
    public function getDescription(): string
    {
        return 'Ajout des champs image_name et image_size sur la table users';
    }

    public function up(Schema $schema): void
    {
        $this->addSql('ALTER TABLE users ADD image_name VARCHAR(255) DEFAULT NULL, ADD image_size INT DEFAULT NULL');
    }

    public function down(Schema $schema): void
    {
        $this->addSql('ALTER TABLE users DROP image_name, DROP image_size');
    }
}
