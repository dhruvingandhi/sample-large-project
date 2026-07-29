# Explore: explore_1653
# Auto-generated LookML Explore File

include: "/views/domain_10/view_04960.view.lkml"
include: "/views/domain_12/view_04962.view.lkml"
include: "/views/domain_13/view_04963.view.lkml"
include: "/views/domain_14/view_04964.view.lkml"

explore: explore_1653 {
  label: "Explore Explore 1653"
  description: "Comprehensive analytics explore joining base view_04960 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_04960
  
  always_filter: {
    filters: [view_04960.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04960.created_at_date: "7 days"]
    unless: [view_04960.id, view_04960.status]
  }

  join: view_04962 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04960.user_id} = ${view_04962.id} ;;
    required_joins: []
  }

  join: view_04963 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04960.account_id} = ${view_04963.account_id} ;;
    required_joins: [view_04962]
  }

  join: view_04964 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04960.category} = ${view_04964.category} ;;
  }

  access_filter: {
    field: view_04960.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04960.is_deleted} = false ;;
}
