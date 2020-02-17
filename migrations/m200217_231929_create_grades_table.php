<?php

use yii\db\Migration;

/**
 * Handles the creation of table `{{%grades}}`.
 */
class m200217_231929_create_grades_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable('{{%grades}}', [
            'id' => $this->primaryKey(),
        ]);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropTable('{{%grades}}');
    }
}
