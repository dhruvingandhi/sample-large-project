# Explore: explore_0786
# Auto-generated LookML Explore File

include: "/views/domain_09/view_02359.view.lkml"
include: "/views/domain_11/view_02361.view.lkml"
include: "/views/domain_12/view_02362.view.lkml"
include: "/views/domain_13/view_02363.view.lkml"

explore: explore_0786 {
  label: "Explore Explore 0786"
  description: "Comprehensive analytics explore joining base view_02359 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_02359
  
  always_filter: {
    filters: [view_02359.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02359.created_at_date: "7 days"]
    unless: [view_02359.id, view_02359.status]
  }

  join: view_02361 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02359.user_id} = ${view_02361.id} ;;
    required_joins: []
  }

  join: view_02362 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02359.account_id} = ${view_02362.account_id} ;;
    required_joins: [view_02361]
  }

  join: view_02363 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02359.category} = ${view_02363.category} ;;
  }

  access_filter: {
    field: view_02359.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02359.is_deleted} = false ;;
}
