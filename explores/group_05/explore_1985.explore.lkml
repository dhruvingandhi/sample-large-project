# Explore: explore_1985
# Auto-generated LookML Explore File

include: "/views/domain_06/view_05956.view.lkml"
include: "/views/domain_08/view_05958.view.lkml"
include: "/views/domain_09/view_05959.view.lkml"
include: "/views/domain_10/view_05960.view.lkml"

explore: explore_1985 {
  label: "Explore Explore 1985"
  description: "Comprehensive analytics explore joining base view_05956 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_05956
  
  always_filter: {
    filters: [view_05956.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05956.created_at_date: "7 days"]
    unless: [view_05956.id, view_05956.status]
  }

  join: view_05958 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05956.user_id} = ${view_05958.id} ;;
    required_joins: []
  }

  join: view_05959 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05956.account_id} = ${view_05959.account_id} ;;
    required_joins: [view_05958]
  }

  join: view_05960 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05956.category} = ${view_05960.category} ;;
  }

  access_filter: {
    field: view_05956.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05956.is_deleted} = false ;;
}
