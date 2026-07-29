# Explore: explore_1428
# Auto-generated LookML Explore File

include: "/views/domain_35/view_04285.view.lkml"
include: "/views/domain_37/view_04287.view.lkml"
include: "/views/domain_38/view_04288.view.lkml"
include: "/views/domain_39/view_04289.view.lkml"

explore: explore_1428 {
  label: "Explore Explore 1428"
  description: "Comprehensive analytics explore joining base view_04285 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_04285
  
  always_filter: {
    filters: [view_04285.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04285.created_at_date: "7 days"]
    unless: [view_04285.id, view_04285.status]
  }

  join: view_04287 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04285.user_id} = ${view_04287.id} ;;
    required_joins: []
  }

  join: view_04288 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04285.account_id} = ${view_04288.account_id} ;;
    required_joins: [view_04287]
  }

  join: view_04289 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04285.category} = ${view_04289.category} ;;
  }

  access_filter: {
    field: view_04285.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04285.is_deleted} = false ;;
}
