# Explore: explore_3310
# Auto-generated LookML Explore File

include: "/views/domain_31/view_09931.view.lkml"
include: "/views/domain_33/view_09933.view.lkml"
include: "/views/domain_34/view_09934.view.lkml"
include: "/views/domain_35/view_09935.view.lkml"

explore: explore_3310 {
  label: "Explore Explore 3310"
  description: "Comprehensive analytics explore joining base view_09931 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_09931
  
  always_filter: {
    filters: [view_09931.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09931.created_at_date: "7 days"]
    unless: [view_09931.id, view_09931.status]
  }

  join: view_09933 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09931.user_id} = ${view_09933.id} ;;
    required_joins: []
  }

  join: view_09934 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09931.account_id} = ${view_09934.account_id} ;;
    required_joins: [view_09933]
  }

  join: view_09935 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09931.category} = ${view_09935.category} ;;
  }

  access_filter: {
    field: view_09931.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09931.is_deleted} = false ;;
}
