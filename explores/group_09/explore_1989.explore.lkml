# Explore: explore_1989
# Auto-generated LookML Explore File

include: "/views/domain_18/view_05968.view.lkml"
include: "/views/domain_20/view_05970.view.lkml"
include: "/views/domain_21/view_05971.view.lkml"
include: "/views/domain_22/view_05972.view.lkml"

explore: explore_1989 {
  label: "Explore Explore 1989"
  description: "Comprehensive analytics explore joining base view_05968 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_05968
  
  always_filter: {
    filters: [view_05968.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05968.created_at_date: "7 days"]
    unless: [view_05968.id, view_05968.status]
  }

  join: view_05970 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05968.user_id} = ${view_05970.id} ;;
    required_joins: []
  }

  join: view_05971 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05968.account_id} = ${view_05971.account_id} ;;
    required_joins: [view_05970]
  }

  join: view_05972 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05968.category} = ${view_05972.category} ;;
  }

  access_filter: {
    field: view_05968.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05968.is_deleted} = false ;;
}
