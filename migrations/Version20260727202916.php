<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20260727202916 extends AbstractMigration
{
    public function getDescription(): string
    {
        return 'Ajout du champ is_verified sur la table users';
    }

    public function up(Schema $schema): void
    {
        $this->addSql('ALTER TABLE users ADD is_verified TINYINT NOT NULL');
    }

    public function down(Schema $schema): void
    {
        $this->addSql('ALTER TABLE users DROP is_verified');
    }
}
