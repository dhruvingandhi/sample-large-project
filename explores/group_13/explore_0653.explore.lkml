# Explore: explore_0653
# Auto-generated LookML Explore File

include: "/views/domain_10/view_01960.view.lkml"
include: "/views/domain_12/view_01962.view.lkml"
include: "/views/domain_13/view_01963.view.lkml"
include: "/views/domain_14/view_01964.view.lkml"

explore: explore_0653 {
  label: "Explore Explore 0653"
  description: "Comprehensive analytics explore joining base view_01960 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_01960
  
  always_filter: {
    filters: [view_01960.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01960.created_at_date: "7 days"]
    unless: [view_01960.id, view_01960.status]
  }

  join: view_01962 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01960.user_id} = ${view_01962.id} ;;
    required_joins: []
  }

  join: view_01963 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01960.account_id} = ${view_01963.account_id} ;;
    required_joins: [view_01962]
  }

  join: view_01964 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01960.category} = ${view_01964.category} ;;
  }

  access_filter: {
    field: view_01960.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01960.is_deleted} = false ;;
}
