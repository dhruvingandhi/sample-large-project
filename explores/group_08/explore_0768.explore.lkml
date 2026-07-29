# Explore: explore_0768
# Auto-generated LookML Explore File

include: "/views/domain_05/view_02305.view.lkml"
include: "/views/domain_07/view_02307.view.lkml"
include: "/views/domain_08/view_02308.view.lkml"
include: "/views/domain_09/view_02309.view.lkml"

explore: explore_0768 {
  label: "Explore Explore 0768"
  description: "Comprehensive analytics explore joining base view_02305 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_02305
  
  always_filter: {
    filters: [view_02305.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02305.created_at_date: "7 days"]
    unless: [view_02305.id, view_02305.status]
  }

  join: view_02307 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02305.user_id} = ${view_02307.id} ;;
    required_joins: []
  }

  join: view_02308 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02305.account_id} = ${view_02308.account_id} ;;
    required_joins: [view_02307]
  }

  join: view_02309 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02305.category} = ${view_02309.category} ;;
  }

  access_filter: {
    field: view_02305.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02305.is_deleted} = false ;;
}
