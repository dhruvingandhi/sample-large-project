# Explore: explore_0090
# Auto-generated LookML Explore File

include: "/views/domain_21/view_00271.view.lkml"
include: "/views/domain_23/view_00273.view.lkml"
include: "/views/domain_24/view_00274.view.lkml"
include: "/views/domain_25/view_00275.view.lkml"

explore: explore_0090 {
  label: "Explore Explore 0090"
  description: "Comprehensive analytics explore joining base view_00271 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_00271
  
  always_filter: {
    filters: [view_00271.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00271.created_at_date: "7 days"]
    unless: [view_00271.id, view_00271.status]
  }

  join: view_00273 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00271.user_id} = ${view_00273.id} ;;
    required_joins: []
  }

  join: view_00274 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00271.account_id} = ${view_00274.account_id} ;;
    required_joins: [view_00273]
  }

  join: view_00275 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00271.category} = ${view_00275.category} ;;
  }

  access_filter: {
    field: view_00271.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00271.is_deleted} = false ;;
}
