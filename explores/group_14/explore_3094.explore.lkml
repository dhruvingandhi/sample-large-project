# Explore: explore_3094
# Auto-generated LookML Explore File

include: "/views/domain_33/view_09283.view.lkml"
include: "/views/domain_35/view_09285.view.lkml"
include: "/views/domain_36/view_09286.view.lkml"
include: "/views/domain_37/view_09287.view.lkml"

explore: explore_3094 {
  label: "Explore Explore 3094"
  description: "Comprehensive analytics explore joining base view_09283 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_09283
  
  always_filter: {
    filters: [view_09283.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09283.created_at_date: "7 days"]
    unless: [view_09283.id, view_09283.status]
  }

  join: view_09285 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09283.user_id} = ${view_09285.id} ;;
    required_joins: []
  }

  join: view_09286 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09283.account_id} = ${view_09286.account_id} ;;
    required_joins: [view_09285]
  }

  join: view_09287 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09283.category} = ${view_09287.category} ;;
  }

  access_filter: {
    field: view_09283.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09283.is_deleted} = false ;;
}
