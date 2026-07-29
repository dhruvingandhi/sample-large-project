# Explore: explore_0044
# Auto-generated LookML Explore File

include: "/views/domain_33/view_00133.view.lkml"
include: "/views/domain_35/view_00135.view.lkml"
include: "/views/domain_36/view_00136.view.lkml"
include: "/views/domain_37/view_00137.view.lkml"

explore: explore_0044 {
  label: "Explore Explore 0044"
  description: "Comprehensive analytics explore joining base view_00133 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_00133
  
  always_filter: {
    filters: [view_00133.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00133.created_at_date: "7 days"]
    unless: [view_00133.id, view_00133.status]
  }

  join: view_00135 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00133.user_id} = ${view_00135.id} ;;
    required_joins: []
  }

  join: view_00136 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00133.account_id} = ${view_00136.account_id} ;;
    required_joins: [view_00135]
  }

  join: view_00137 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00133.category} = ${view_00137.category} ;;
  }

  access_filter: {
    field: view_00133.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00133.is_deleted} = false ;;
}
