<?php
$dictionary["tc_sub_products"] = array(
	'from_studio' => false,
	'table' => 'tc_sub_products',
	'fields' =>
	array(
		0 =>
		array(
			'name' => 'id',
			'type' => 'varchar',
			'len' => 255,
		),
		1 =>
		array(
			'name' => 'name',
			'type' => 'varchar',
			'len' => 255,
		),
		2 =>
		array(
			'name' => 'date_entered',
			'type' => 'datetime',
		),
		3 =>
		array(
			'name' => 'parent_id',
			'type' => 'varchar',
			'len' => 255,
		),
		4 =>
		array(
			'name' => 'has_sub_products',
			'type' => 'bool',
			'len' => '1',
			'default' => '0',
		),
		5 =>
		array(
			'name' => 'deleted',
			'type' => 'bool',
			'len' => '1',
			'default' => '0',
		),
		6 =>
		array(
			'name' => 'sub_product_type',
			'type' => 'varchar',
			'len' => 255,
		),
		7 =>
		array(
			'name' => 'sub_product_sku',
			'type' => 'varchar',
			'len' => 255,
		),
		8 =>
		array(
			'name' => 'sub_product_description',
			'type' => 'text',
			'len' => 255,
		),
	),
	'indices' =>
	array(
		0 =>
		array(
			'name' => 'tc_sub_products_pk',
			'type' => 'primary',
			'fields' =>
			array(
			0 => 'id',
			),
		),
	),
);