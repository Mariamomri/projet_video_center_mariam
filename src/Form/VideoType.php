<?php

namespace App\Form;

use App\Entity\Video;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;

class VideoType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('title', TextType::class, [
                'label' => 'videoForm.title'
            ])
            ->add('videoLink', TextType::class, [
                'label' => 'videoForm.videoLink'
            ])
            ->add('descritpion', TextareaType::class, [
                'label' => 'videoForm.descritpion'
            ])
            ->add('premiumVideo', CheckboxType::class, [
                'label' => 'videoForm.premiumVideo',
                'required' => false
            ])
            ->add('save', SubmitType::class, [
                'label' => 'videoForm.save',
                'attr' => ['class' => 'btn btn-space']
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Video::class,
        ]);
    }
}
