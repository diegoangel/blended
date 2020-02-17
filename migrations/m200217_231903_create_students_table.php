<?php

use yii\db\Migration;

/**
 * Handles the creation of table `{{%students}}`.
 */
class m200217_231903_create_students_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable('{{%students}}', [
            'id' => $this->primaryKey(),
        ]);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropTable('{{%students}}');
    }
}
