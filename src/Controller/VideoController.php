<?php

namespace App\Controller;

use App\Entity\Video;
use App\Form\VideoType;
use App\Repository\VideoRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Attribute\Route;
use App\Entity\User;
use App\Form\SearchType;
use App\Model\SearchData;

final class VideoController extends AbstractController
{
    #[Route(path: "/", name: "app_home")]
    public function index(VideoRepository $repository, Request $request): Response
    {
        $searchData = new SearchData();
        $form = $this->createForm(SearchType::class, $searchData);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $searchData->page = $request->query->getInt('page', 1);
            $videos = $repository->findBySearch($searchData);

            return $this->render('video/index.html.twig', [
                'form' => $form,
                'videos' => $videos
            ]);
        }

        $videos = $repository->findVideos($request->query->getInt('page', 1));

        return $this->render('video/index.html.twig', [
            'form' => $form,
            'videos' => $videos
        ]);
    }

    #[Route(path: "/video/{id}", name: "app_video_show", requirements: ['id' => '\d+'])]
    public function show(Video $video): Response
    {
        if ($video->isPremiumVideo()) {
            if (!$this->getUser()) {
                $this->addFlash('error', 'Vous devez vous connecter pour voir une Vidéo Prémium !');
                return $this->redirectToRoute('app_login');
            }
            /** @var User $user */
            $user = $this->getUser();
            if (!$user->isVerified()) {
                $this->addFlash('error', 'Vous devez confirmer votre email pour voir une Vidéo Prémium !');
                return $this->redirectToRoute('app_home');
            }
        }

        return $this->render('video/show.html.twig', [
            'video' => $video
        ]);
    }


    #[Route(path: '/video/{id}/edit', name: 'app_video_edit')]
    public function edit(Video $video, Request $request, EntityManagerInterface $em): Response
    {
        $form = $this->createForm(VideoType::class, $video);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em->flush();
            return $this->redirectToRoute('app_video_show', ['id' => $video->getId()]);
        }

        return $this->render('video/edit.html.twig', [
            'video' => $video,
            'monForm' => $form
        ]);
    }


    #[Route(path: '/video/create', name: 'app_video_create')]
    public function create(Request $request, EntityManagerInterface $em): Response
    {
        if (!$this->getUser()) {
            $this->addFlash('error', 'Vous devez vous connecter pour créer une vidéo !');
            return $this->redirectToRoute('app_login');
        }

        $video = new Video;
        $form = $this->createForm(VideoType::class, $video);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $video->setUser($this->getUser());
            $em->persist($video);
            $em->flush();
            return $this->redirectToRoute('app_home');
        }

        return $this->render('video/create.html.twig', [
            'monForm' => $form
        ]);
    }


    #[Route(path: '/video/{id}/delete', name: 'app_video_delete')]
    public function delete(Video $video, EntityManagerInterface $em): Response
    {
        $em->remove($video);
        $em->flush();
        return $this->redirectToRoute('app_home');
    }
}
