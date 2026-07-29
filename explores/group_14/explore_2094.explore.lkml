# Explore: explore_2094
# Auto-generated LookML Explore File

include: "/views/domain_33/view_06283.view.lkml"
include: "/views/domain_35/view_06285.view.lkml"
include: "/views/domain_36/view_06286.view.lkml"
include: "/views/domain_37/view_06287.view.lkml"

explore: explore_2094 {
  label: "Explore Explore 2094"
  description: "Comprehensive analytics explore joining base view_06283 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_06283
  
  always_filter: {
    filters: [view_06283.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06283.created_at_date: "7 days"]
    unless: [view_06283.id, view_06283.status]
  }

  join: view_06285 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06283.user_id} = ${view_06285.id} ;;
    required_joins: []
  }

  join: view_06286 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06283.account_id} = ${view_06286.account_id} ;;
    required_joins: [view_06285]
  }

  join: view_06287 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06283.category} = ${view_06287.category} ;;
  }

  access_filter: {
    field: view_06283.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06283.is_deleted} = false ;;
}
