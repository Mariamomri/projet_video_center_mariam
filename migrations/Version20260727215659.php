<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20260727215659 extends AbstractMigration
{
    public function getDescription(): string
    {
        return 'Ajout du champ premium_video sur la table videos';
    }

    public function up(Schema $schema): void
    {
        $this->addSql('ALTER TABLE videos ADD premium_video TINYINT NOT NULL');
    }

    public function down(Schema $schema): void
    {
        $this->addSql('ALTER TABLE videos DROP premium_video');
    }
}
