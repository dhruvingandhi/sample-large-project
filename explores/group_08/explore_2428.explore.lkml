# Explore: explore_2428
# Auto-generated LookML Explore File

include: "/views/domain_35/view_07285.view.lkml"
include: "/views/domain_37/view_07287.view.lkml"
include: "/views/domain_38/view_07288.view.lkml"
include: "/views/domain_39/view_07289.view.lkml"

explore: explore_2428 {
  label: "Explore Explore 2428"
  description: "Comprehensive analytics explore joining base view_07285 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_07285
  
  always_filter: {
    filters: [view_07285.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07285.created_at_date: "7 days"]
    unless: [view_07285.id, view_07285.status]
  }

  join: view_07287 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07285.user_id} = ${view_07287.id} ;;
    required_joins: []
  }

  join: view_07288 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07285.account_id} = ${view_07288.account_id} ;;
    required_joins: [view_07287]
  }

  join: view_07289 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07285.category} = ${view_07289.category} ;;
  }

  access_filter: {
    field: view_07285.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07285.is_deleted} = false ;;
}
