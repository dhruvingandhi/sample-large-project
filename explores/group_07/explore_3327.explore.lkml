# Explore: explore_3327
# Auto-generated LookML Explore File

include: "/views/domain_32/view_09982.view.lkml"
include: "/views/domain_34/view_09984.view.lkml"
include: "/views/domain_35/view_09985.view.lkml"
include: "/views/domain_36/view_09986.view.lkml"

explore: explore_3327 {
  label: "Explore Explore 3327"
  description: "Comprehensive analytics explore joining base view_09982 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_09982
  
  always_filter: {
    filters: [view_09982.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09982.created_at_date: "7 days"]
    unless: [view_09982.id, view_09982.status]
  }

  join: view_09984 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09982.user_id} = ${view_09984.id} ;;
    required_joins: []
  }

  join: view_09985 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09982.account_id} = ${view_09985.account_id} ;;
    required_joins: [view_09984]
  }

  join: view_09986 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09982.category} = ${view_09986.category} ;;
  }

  access_filter: {
    field: view_09982.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09982.is_deleted} = false ;;
}
