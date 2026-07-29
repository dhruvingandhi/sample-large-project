# Explore: explore_0956
# Auto-generated LookML Explore File

include: "/views/domain_19/view_02869.view.lkml"
include: "/views/domain_21/view_02871.view.lkml"
include: "/views/domain_22/view_02872.view.lkml"
include: "/views/domain_23/view_02873.view.lkml"

explore: explore_0956 {
  label: "Explore Explore 0956"
  description: "Comprehensive analytics explore joining base view_02869 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_02869
  
  always_filter: {
    filters: [view_02869.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02869.created_at_date: "7 days"]
    unless: [view_02869.id, view_02869.status]
  }

  join: view_02871 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02869.user_id} = ${view_02871.id} ;;
    required_joins: []
  }

  join: view_02872 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02869.account_id} = ${view_02872.account_id} ;;
    required_joins: [view_02871]
  }

  join: view_02873 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02869.category} = ${view_02873.category} ;;
  }

  access_filter: {
    field: view_02869.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02869.is_deleted} = false ;;
}
