# Explore: explore_0836
# Auto-generated LookML Explore File

include: "/views/domain_09/view_02509.view.lkml"
include: "/views/domain_11/view_02511.view.lkml"
include: "/views/domain_12/view_02512.view.lkml"
include: "/views/domain_13/view_02513.view.lkml"

explore: explore_0836 {
  label: "Explore Explore 0836"
  description: "Comprehensive analytics explore joining base view_02509 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_02509
  
  always_filter: {
    filters: [view_02509.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02509.created_at_date: "7 days"]
    unless: [view_02509.id, view_02509.status]
  }

  join: view_02511 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02509.user_id} = ${view_02511.id} ;;
    required_joins: []
  }

  join: view_02512 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02509.account_id} = ${view_02512.account_id} ;;
    required_joins: [view_02511]
  }

  join: view_02513 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02509.category} = ${view_02513.category} ;;
  }

  access_filter: {
    field: view_02509.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02509.is_deleted} = false ;;
}
