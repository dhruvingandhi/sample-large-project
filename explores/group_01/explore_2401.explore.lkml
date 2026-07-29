# Explore: explore_2401
# Auto-generated LookML Explore File

include: "/views/domain_04/view_07204.view.lkml"
include: "/views/domain_06/view_07206.view.lkml"
include: "/views/domain_07/view_07207.view.lkml"
include: "/views/domain_08/view_07208.view.lkml"

explore: explore_2401 {
  label: "Explore Explore 2401"
  description: "Comprehensive analytics explore joining base view_07204 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_07204
  
  always_filter: {
    filters: [view_07204.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07204.created_at_date: "7 days"]
    unless: [view_07204.id, view_07204.status]
  }

  join: view_07206 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07204.user_id} = ${view_07206.id} ;;
    required_joins: []
  }

  join: view_07207 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07204.account_id} = ${view_07207.account_id} ;;
    required_joins: [view_07206]
  }

  join: view_07208 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07204.category} = ${view_07208.category} ;;
  }

  access_filter: {
    field: view_07204.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07204.is_deleted} = false ;;
}
