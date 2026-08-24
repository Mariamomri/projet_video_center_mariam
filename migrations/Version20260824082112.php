<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20260824082112 extends AbstractMigration
{
    public function getDescription(): string
    {
        return 'Ajout du champ created_at sur la table comment';
    }

    public function up(Schema $schema): void
    {
        $this->addSql('ALTER TABLE comment ADD created_at DATETIME NOT NULL');
    }

    public function down(Schema $schema): void
    {
        $this->addSql('ALTER TABLE comment DROP created_at');
    }
}
