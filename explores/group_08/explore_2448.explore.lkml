# Explore: explore_2448
# Auto-generated LookML Explore File

include: "/views/domain_45/view_07345.view.lkml"
include: "/views/domain_47/view_07347.view.lkml"
include: "/views/domain_48/view_07348.view.lkml"
include: "/views/domain_49/view_07349.view.lkml"

explore: explore_2448 {
  label: "Explore Explore 2448"
  description: "Comprehensive analytics explore joining base view_07345 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_07345
  
  always_filter: {
    filters: [view_07345.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07345.created_at_date: "7 days"]
    unless: [view_07345.id, view_07345.status]
  }

  join: view_07347 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07345.user_id} = ${view_07347.id} ;;
    required_joins: []
  }

  join: view_07348 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07345.account_id} = ${view_07348.account_id} ;;
    required_joins: [view_07347]
  }

  join: view_07349 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07345.category} = ${view_07349.category} ;;
  }

  access_filter: {
    field: view_07345.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07345.is_deleted} = false ;;
}
