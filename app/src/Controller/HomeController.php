<?php

namespace App\Controller;

use Exception;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
{
    /**
     * @throws Exception
     */
    #[Route('/')]
    public function home(): Response
    {
        return $this->render('home.html.twig', [
            'message' => "Hello Project!",
        ]);
    }
}
