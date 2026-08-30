<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20260827110926 extends AbstractMigration
{
    public function getDescription(): string
    {
        return 'Création de la table video_user pour les likes';
    }

    public function up(Schema $schema): void
    {
        $this->addSql('CREATE TABLE video_user (video_id INT NOT NULL, user_id INT NOT NULL, INDEX IDX_8A048B9529C1004E (video_id), INDEX IDX_8A048B95A76ED395 (user_id), PRIMARY KEY (video_id, user_id)) DEFAULT CHARACTER SET utf8mb4');
        $this->addSql('ALTER TABLE video_user ADD CONSTRAINT FK_8A048B9529C1004E FOREIGN KEY (video_id) REFERENCES videos (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE video_user ADD CONSTRAINT FK_8A048B95A76ED395 FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE');
    }

    public function down(Schema $schema): void
    {
        $this->addSql('ALTER TABLE video_user DROP FOREIGN KEY FK_8A048B9529C1004E');
        $this->addSql('ALTER TABLE video_user DROP FOREIGN KEY FK_8A048B95A76ED395');
        $this->addSql('DROP TABLE video_user');
    }
}
