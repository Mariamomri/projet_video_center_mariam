<?php

namespace App\Controller;

use App\Entity\Video;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;

class LikeController extends AbstractController
{
    #[Route('/like/video/{id}', name: 'like.video', methods: ['GET'])]
    #[IsGranted('ROLE_USER')]
    public function like(Video $video, EntityManagerInterface $manager): Response
    {
        $user = $this->getUser();

        if ($video->isLikedByUser($user)) {
            $video->removeLike($user);
            $manager->flush();

            return $this->json([
                'message' => 'Le like a été supprimé.',
                'nbLike' => $video->howManyLikes(),
                'liked' => false,
            ]);
        }

        $video->addLike($user);
        $manager->flush();

        return $this->json([
            'message' => 'Le like a été ajouté.',
            'nbLike' => $video->howManyLikes(),
            'liked' => true,
        ]);
    }
}
