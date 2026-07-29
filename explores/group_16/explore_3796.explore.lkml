# Explore: explore_3796
# Auto-generated LookML Explore File

include: "/views/domain_39/view_11389.view.lkml"
include: "/views/domain_41/view_11391.view.lkml"
include: "/views/domain_42/view_11392.view.lkml"
include: "/views/domain_43/view_11393.view.lkml"

explore: explore_3796 {
  label: "Explore Explore 3796"
  description: "Comprehensive analytics explore joining base view_11389 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_11389
  
  always_filter: {
    filters: [view_11389.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11389.created_at_date: "7 days"]
    unless: [view_11389.id, view_11389.status]
  }

  join: view_11391 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11389.user_id} = ${view_11391.id} ;;
    required_joins: []
  }

  join: view_11392 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11389.account_id} = ${view_11392.account_id} ;;
    required_joins: [view_11391]
  }

  join: view_11393 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11389.category} = ${view_11393.category} ;;
  }

  access_filter: {
    field: view_11389.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11389.is_deleted} = false ;;
}
