<?php

namespace App\EventListener;

use App\Entity\User;
use Symfony\Component\HttpFoundation\Session\FlashBagAwareSessionInterface;
use Symfony\Component\Security\Http\Event\LoginSuccessEvent;
use Symfony\Component\EventDispatcher\Attribute\AsEventListener;
use Symfony\Contracts\Translation\TranslatorInterface;

class LoginSuccessListener
{
  public function __construct(private TranslatorInterface $translator) {}

  #[AsEventListener(event: LoginSuccessEvent::class)]
  public function onLoginSuccess(LoginSuccessEvent $event): void
  {
    /** @var User $user */
    $user = $event->getUser();

    $request = $event->getRequest();
    $session = $request->getSession();

    if ($session instanceof FlashBagAwareSessionInterface) {
      $session->getFlashBag()->add('info', $this->translator->trans('Welcome ') . $user->getFirstname() . ' !');
    }
  }
}
