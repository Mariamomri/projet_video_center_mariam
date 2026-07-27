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

final class VideoController extends AbstractController
{
    #[Route(path: "/", name: "app_home")]
    public function index(VideoRepository $repository): Response
    {
        $videos = $repository->findAll();

        return $this->render('video/index.html.twig', [
            'videos' => $videos
        ]);
    }

    #[Route(path: "/video/{id}", name: "app_video_show")]
    public function show(Video $video): Response
    {
        return $this->render('video/show.html.twig', [
            'video' => $video
        ]);
    }

    #[Route(path: '/video/create', name: 'app_video_create')]
    public function create(Request $request, EntityManagerInterface $em): Response
    {
        $video = new Video;
        $form = $this->createForm(VideoType::class, $video);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em->persist($video);
            $em->flush();
            return $this->redirectToRoute('app_home');
        }

        return $this->render('video/create.html.twig', [
            'monForm' => $form
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

    #[Route(path: '/video/{id}/delete', name: 'app_video_delete')]
    public function delete(Video $video, EntityManagerInterface $em): Response
    {
        $em->remove($video);
        $em->flush();
        return $this->redirectToRoute('app_home');
    }
}
