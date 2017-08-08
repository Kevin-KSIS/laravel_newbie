<?php

use Illuminate\Database\Seeder;

class Fake_all_database extends Seeder
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
        for ($i = 0; $i < 12; $i++) {
            DB::table('users')->insert([ //,
                'email' => $faker->unique()->email,
                'username' => $faker->firstName(),
                'password' => bcrypt('gv@123'),
                'role' => 2,
                'created_at' => $faker->dateTimeBetween('now', '1508470327'),
            ]);
        }
        
        // User students
        for ($i = 0; $i < 200; $i++) {
            DB::table('users')->insert([ //,
                'email' => $faker->unique()->email,
                'username' => $faker->name(),
                'password' => bcrypt('st@123'),
                'role' => 1,
                'created_at' => $faker->dateTimeBetween('now', '1508470327'),
            ]);
        }

        // classes
        $teacher_id = DB::table('users')->where('role', 2)->pluck('id')->toArray();
    	$limit = 12;

        for ($i = 0; $i < $limit; $i++) {
            DB::table('classes')->insert([ //,
                'name' => $faker->jobTitle,
                'teacher_id' => $faker->randomElement($teacher_id),
                'description' => $faker -> text($maxNbChars = 100),
                'created_at' => $faker->dateTimeBetween('now', '1508470327'),
            ]);
        }

        // members
        $limit = 120;
        $class_id = DB::table('classes')->pluck('id')->toArray();
        $member_id = DB::table('users')->where('role', '1')->pluck('id')->toArray();

        for($i=0; $i<$limit; $i++){
	        DB::table('members')->insert([ //,
	            'class_id' => $faker->randomElement($class_id),
	            'student_id' => $faker->randomElement($member_id),
	            'accepted' => $faker->randomElement(array(0, 1)),
	            'created_at' => $faker->dateTimeBetween('now', '1508470327'),
	        ]);
	    }
    }
}
