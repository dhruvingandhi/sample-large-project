# Explore: explore_1401
# Auto-generated LookML Explore File

include: "/views/domain_04/view_04204.view.lkml"
include: "/views/domain_06/view_04206.view.lkml"
include: "/views/domain_07/view_04207.view.lkml"
include: "/views/domain_08/view_04208.view.lkml"

explore: explore_1401 {
  label: "Explore Explore 1401"
  description: "Comprehensive analytics explore joining base view_04204 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_04204
  
  always_filter: {
    filters: [view_04204.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04204.created_at_date: "7 days"]
    unless: [view_04204.id, view_04204.status]
  }

  join: view_04206 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04204.user_id} = ${view_04206.id} ;;
    required_joins: []
  }

  join: view_04207 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04204.account_id} = ${view_04207.account_id} ;;
    required_joins: [view_04206]
  }

  join: view_04208 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04204.category} = ${view_04208.category} ;;
  }

  access_filter: {
    field: view_04204.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04204.is_deleted} = false ;;
}
