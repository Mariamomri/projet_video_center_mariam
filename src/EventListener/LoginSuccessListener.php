<?php

namespace App\EventListener;

use App\Entity\User;
use Symfony\Component\HttpFoundation\Session\FlashBagAwareSessionInterface;
use Symfony\Component\Security\Http\Event\LoginSuccessEvent;
use Symfony\Component\EventDispatcher\Attribute\AsEventListener;

class LoginSuccessListener
{
  #[AsEventListener(event: LoginSuccessEvent::class)]
  public function onLoginSuccess(LoginSuccessEvent $event): void
  {
    /** @var User $user */
    $user = $event->getUser();

    $request = $event->getRequest();
    $session = $request->getSession();

    if ($session instanceof FlashBagAwareSessionInterface) {
      $session->getFlashBag()->add('info', 'Bienvenue ' . $user->getFirstname() . ' !');
    }
  }
}
