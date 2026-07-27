<?php

namespace App\Validator;

use Symfony\Component\Validator\Constraint;

#[\Attribute(\Attribute::TARGET_PROPERTY | \Attribute::TARGET_METHOD | \Attribute::IS_REPEATABLE)]
final class InappropriateWords extends Constraint
{
    public function __construct(
        public array $listWords = ['shit', 'callypige'],
        public string $message = 'This contains an inappropriate word "{{ inappropriateWord }}".',
        mixed $options = null,
        ?array $groups = null,
        mixed $payload = null
    ) {
        parent::__construct($options, $groups, $payload);
    }
}
