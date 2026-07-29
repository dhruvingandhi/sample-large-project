# Explore: explore_0269
# Auto-generated LookML Explore File

include: "/views/domain_08/view_00808.view.lkml"
include: "/views/domain_10/view_00810.view.lkml"
include: "/views/domain_11/view_00811.view.lkml"
include: "/views/domain_12/view_00812.view.lkml"

explore: explore_0269 {
  label: "Explore Explore 0269"
  description: "Comprehensive analytics explore joining base view_00808 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_00808
  
  always_filter: {
    filters: [view_00808.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00808.created_at_date: "7 days"]
    unless: [view_00808.id, view_00808.status]
  }

  join: view_00810 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00808.user_id} = ${view_00810.id} ;;
    required_joins: []
  }

  join: view_00811 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00808.account_id} = ${view_00811.account_id} ;;
    required_joins: [view_00810]
  }

  join: view_00812 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00808.category} = ${view_00812.category} ;;
  }

  access_filter: {
    field: view_00808.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00808.is_deleted} = false ;;
}
