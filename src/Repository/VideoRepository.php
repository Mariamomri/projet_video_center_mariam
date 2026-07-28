<?php

namespace App\Repository;

use App\Entity\Video;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

use Knp\Component\Pager\Pagination\PaginationInterface;
use Knp\Component\Pager\PaginatorInterface;

use App\Model\SearchData;

/**
 * @extends ServiceEntityRepository<Video>
 */
class VideoRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry, private PaginatorInterface $paginatorInterface)
    {
        parent::__construct($registry, Video::class);
    }

    /**
     * @param int $page
     * @return PaginationInterface
     */


    public function findVideos(int $page): PaginationInterface
    {
        $data = $this->createQueryBuilder('v')
            ->getQuery()
            ->getResult();

        $videos = $this->paginatorInterface->paginate($data, $page, 9);
        return $videos;
    }



    /**
     * @param SearchData $searchData
     * @return PaginationInterface
     */
    public function findBySearch(SearchData $searchData): PaginationInterface
    {
        $data = $this->createQueryBuilder('v');

        if (!empty($searchData->q)) {
            $data = $data
                ->andWhere('v.title LIKE :q OR v.descritpion LIKE :q')
                ->setParameter('q', "%{$searchData->q}%");
        }

        $data = $data
            ->getQuery()
            ->getResult();

        $videos = $this->paginatorInterface->paginate($data, $searchData->page, 6);
        return $videos;
    }
}
