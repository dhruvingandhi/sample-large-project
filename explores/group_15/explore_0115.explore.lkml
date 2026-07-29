# Explore: explore_0115
# Auto-generated LookML Explore File

include: "/views/domain_46/view_00346.view.lkml"
include: "/views/domain_48/view_00348.view.lkml"
include: "/views/domain_49/view_00349.view.lkml"
include: "/views/domain_50/view_00350.view.lkml"

explore: explore_0115 {
  label: "Explore Explore 0115"
  description: "Comprehensive analytics explore joining base view_00346 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_00346
  
  always_filter: {
    filters: [view_00346.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00346.created_at_date: "7 days"]
    unless: [view_00346.id, view_00346.status]
  }

  join: view_00348 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00346.user_id} = ${view_00348.id} ;;
    required_joins: []
  }

  join: view_00349 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00346.account_id} = ${view_00349.account_id} ;;
    required_joins: [view_00348]
  }

  join: view_00350 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00346.category} = ${view_00350.category} ;;
  }

  access_filter: {
    field: view_00346.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00346.is_deleted} = false ;;
}
