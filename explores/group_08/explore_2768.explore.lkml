# Explore: explore_2768
# Auto-generated LookML Explore File

include: "/views/domain_05/view_08305.view.lkml"
include: "/views/domain_07/view_08307.view.lkml"
include: "/views/domain_08/view_08308.view.lkml"
include: "/views/domain_09/view_08309.view.lkml"

explore: explore_2768 {
  label: "Explore Explore 2768"
  description: "Comprehensive analytics explore joining base view_08305 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_08305
  
  always_filter: {
    filters: [view_08305.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08305.created_at_date: "7 days"]
    unless: [view_08305.id, view_08305.status]
  }

  join: view_08307 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08305.user_id} = ${view_08307.id} ;;
    required_joins: []
  }

  join: view_08308 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08305.account_id} = ${view_08308.account_id} ;;
    required_joins: [view_08307]
  }

  join: view_08309 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08305.category} = ${view_08309.category} ;;
  }

  access_filter: {
    field: view_08305.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08305.is_deleted} = false ;;
}
