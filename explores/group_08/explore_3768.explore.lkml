# Explore: explore_3768
# Auto-generated LookML Explore File

include: "/views/domain_05/view_11305.view.lkml"
include: "/views/domain_07/view_11307.view.lkml"
include: "/views/domain_08/view_11308.view.lkml"
include: "/views/domain_09/view_11309.view.lkml"

explore: explore_3768 {
  label: "Explore Explore 3768"
  description: "Comprehensive analytics explore joining base view_11305 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_11305
  
  always_filter: {
    filters: [view_11305.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11305.created_at_date: "7 days"]
    unless: [view_11305.id, view_11305.status]
  }

  join: view_11307 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11305.user_id} = ${view_11307.id} ;;
    required_joins: []
  }

  join: view_11308 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11305.account_id} = ${view_11308.account_id} ;;
    required_joins: [view_11307]
  }

  join: view_11309 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11305.category} = ${view_11309.category} ;;
  }

  access_filter: {
    field: view_11305.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11305.is_deleted} = false ;;
}
