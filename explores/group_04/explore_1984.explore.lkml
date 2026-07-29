# Explore: explore_1984
# Auto-generated LookML Explore File

include: "/views/domain_03/view_05953.view.lkml"
include: "/views/domain_05/view_05955.view.lkml"
include: "/views/domain_06/view_05956.view.lkml"
include: "/views/domain_07/view_05957.view.lkml"

explore: explore_1984 {
  label: "Explore Explore 1984"
  description: "Comprehensive analytics explore joining base view_05953 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_05953
  
  always_filter: {
    filters: [view_05953.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05953.created_at_date: "7 days"]
    unless: [view_05953.id, view_05953.status]
  }

  join: view_05955 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05953.user_id} = ${view_05955.id} ;;
    required_joins: []
  }

  join: view_05956 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05953.account_id} = ${view_05956.account_id} ;;
    required_joins: [view_05955]
  }

  join: view_05957 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05953.category} = ${view_05957.category} ;;
  }

  access_filter: {
    field: view_05953.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05953.is_deleted} = false ;;
}
