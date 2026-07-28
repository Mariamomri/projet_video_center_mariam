<?php

namespace App\Controller;

use App\Entity\Video;
use App\Entity\User;
use App\Form\VideoType;
use App\Form\SearchType;
use App\Model\SearchData;
use App\Repository\VideoRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Attribute\Route;

use Symfony\Contracts\Translation\TranslatorInterface;

final class VideoController extends AbstractController
{
    #[Route(path: "/", name: "app_home")]
    public function index(VideoRepository $repository, TranslatorInterface $translator, Request $request): Response
    {
        if ($this->getUser()) {
            /** @var User */
            $user = $this->getUser();
            if (!$user->isVerified()) {
                $this->addFlash("info", $translator->trans("videoController.index.emailNotVerified"));
            }
        }
        $searchData = new SearchData();
        $form = $this->createForm(SearchType::class, $searchData);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $searchData->page = $request->query->getInt('page', 1);
            $videos = $repository->findBySearch($searchData);

            return $this->render('video/index.html.twig', [
                'form' => $form->createView(),
                "videos" => $videos
            ]);
        }

        $videos = $repository->findVideos($request->query->getInt('page', 1));

        return $this->render('video/index.html.twig', [
            'form' => $form->createView(),
            "videos" => $videos
        ]);
    }

    #[Route(path: "/video/{id}", name: "app_video_show", requirements: ['id' => '\d+'])]
    public function show(Video $video, TranslatorInterface $translator): Response
    {
        if ($video->isPremiumVideo()) {
            if (!$this->getUser()) {
                $this->addFlash('error', $translator->trans('You must login to view a Premium Video !'));
                return $this->redirectToRoute('app_login');
            }
            /** @var User */
            $user = $this->getUser();
            if (!$user->isVerified()) {
                $this->addFlash('error', $translator->trans('You must confirm your email to view a Premium Video !'));
                return $this->redirectToRoute('app_home');
            }
        }

        return $this->render('video/show.html.twig', [
            "video" => $video
        ]);
    }


    #[Route(path: '/video/{id}/edit', name: 'app_video_edit', requirements: ['id' => '\d+'])]
    public function edit(Video $video, Request $request, EntityManagerInterface $em, TranslatorInterface $translator): Response
    {
        if ($this->getUser()) {
            /** @var User */
            $user = $this->getUser();
            if (!$user->isVerified()) {
                $this->addFlash('error', $translator->trans('You must confirm your email to edit Video !'));
                return $this->redirectToRoute('app_home');
            } elseif ($video->getUser()->getEmail() !== $user->getEmail()) {
                $this->addFlash('error', $translator->trans('You must be the user ') . $video->getUser()->getEmail() . $translator->trans(' to edit this video'));
                return $this->redirectToRoute('app_home');
            }
        } else {
            $this->addFlash('error', $translator->trans('You must login to edit Video !'));
            return $this->redirectToRoute('app_login');
        }

        $form = $this->createForm(VideoType::class, $video);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em->flush();
            $this->addFlash('success', $translator->trans('The video was successfully modified !'));
            return $this->redirectToRoute('app_video_show', ['id' => $video->getId()]);
        }

        return $this->render('video/edit.html.twig', [
            'video' => $video,
            'monForm' => $form
        ]);
    }


    #[Route(path: '/video/create', name: 'app_video_create')]
    public function create(Request $request, EntityManagerInterface $em, TranslatorInterface $translator): Response
    {
        if ($this->getUser()) {
            /** @var User */
            $user = $this->getUser();
            if (!$user->isVerified()) {
                $this->addFlash('error', $translator->trans('You must confirm your email to create Video !'));
                return $this->redirectToRoute('app_home');
            }
        } else {
            $this->addFlash('error', $translator->trans('You must login to create Video !'));
            return $this->redirectToRoute('app_login');
        }

        $video = new Video;
        $form = $this->createForm(VideoType::class, $video);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $video->setUser($this->getUser());
            $em->persist($video);
            $em->flush();
            $this->addFlash('success', $translator->trans('The video ') . $video->getTitle() . $translator->trans(' was successfully created'));
            return $this->redirectToRoute('app_home');
        }

        return $this->render('video/create.html.twig', [
            'monForm' => $form
        ]);
    }

    #[Route(path: '/video/{id}/delete', name: 'app_video_delete', requirements: ['id' => '\d+'])]
    public function delete(Video $video, EntityManagerInterface $em, TranslatorInterface $translator): Response
    {
        if ($this->getUser()) {
            /** @var User */
            $user = $this->getUser();
            if (!$user->isVerified()) {
                $this->addFlash('error', $translator->trans('You must confirm your email to delete Video !'));
                return $this->redirectToRoute('app_home');
            } elseif ($video->getUser()->getEmail() !== $user->getEmail()) {
                $this->addFlash('error', $translator->trans('You must be the user ') . $video->getUser()->getEmail() . $translator->trans(' to delete this video'));
                return $this->redirectToRoute('app_home');
            }
        } else {
            $this->addFlash('error', $translator->trans('You must login to delete Video !'));
            return $this->redirectToRoute('app_login');
        }
        $titre = $video->getTitle();
        $em->remove($video);
        $em->flush();
        $this->addFlash('info', $translator->trans('The video ') . $titre . $translator->trans(' was successfully deleted !'));
        return $this->redirectToRoute('app_home');
    }
}
