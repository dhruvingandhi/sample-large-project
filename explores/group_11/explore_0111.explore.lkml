# Explore: explore_0111
# Auto-generated LookML Explore File

include: "/views/domain_34/view_00334.view.lkml"
include: "/views/domain_36/view_00336.view.lkml"
include: "/views/domain_37/view_00337.view.lkml"
include: "/views/domain_38/view_00338.view.lkml"

explore: explore_0111 {
  label: "Explore Explore 0111"
  description: "Comprehensive analytics explore joining base view_00334 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_00334
  
  always_filter: {
    filters: [view_00334.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00334.created_at_date: "7 days"]
    unless: [view_00334.id, view_00334.status]
  }

  join: view_00336 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00334.user_id} = ${view_00336.id} ;;
    required_joins: []
  }

  join: view_00337 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00334.account_id} = ${view_00337.account_id} ;;
    required_joins: [view_00336]
  }

  join: view_00338 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00334.category} = ${view_00338.category} ;;
  }

  access_filter: {
    field: view_00334.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00334.is_deleted} = false ;;
}
