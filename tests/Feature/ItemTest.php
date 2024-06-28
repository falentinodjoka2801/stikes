<?php

namespace Tests\Feature;

use Database\Seeders\ItemSeeder;
use Tests\TestCase;

class ItemTest extends TestCase
{
    public function testInjectItemFakeData(){
        $this->seed(ItemSeeder::class);
        self::assertTrue(true);
    }
}
