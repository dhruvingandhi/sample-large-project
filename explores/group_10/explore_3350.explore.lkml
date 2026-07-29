# Explore: explore_3350
# Auto-generated LookML Explore File

include: "/views/domain_01/view_10051.view.lkml"
include: "/views/domain_03/view_10053.view.lkml"
include: "/views/domain_04/view_10054.view.lkml"
include: "/views/domain_05/view_10055.view.lkml"

explore: explore_3350 {
  label: "Explore Explore 3350"
  description: "Comprehensive analytics explore joining base view_10051 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_10051
  
  always_filter: {
    filters: [view_10051.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10051.created_at_date: "7 days"]
    unless: [view_10051.id, view_10051.status]
  }

  join: view_10053 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10051.user_id} = ${view_10053.id} ;;
    required_joins: []
  }

  join: view_10054 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10051.account_id} = ${view_10054.account_id} ;;
    required_joins: [view_10053]
  }

  join: view_10055 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10051.category} = ${view_10055.category} ;;
  }

  access_filter: {
    field: view_10051.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10051.is_deleted} = false ;;
}
