<?php

use Illuminate\Database\Seeder;

class test extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker\Factory::create();

        // User teachers
        for ($i = 0; $i < 212; $i++) {
            DB::table('users')
                -> where ('id', '>', 0)
                -> update(['phone_number' => $faker -> phoneNumber ]);
        }
    }
}
