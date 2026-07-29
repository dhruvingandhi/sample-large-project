# Explore: explore_1983
# Auto-generated LookML Explore File

include: "/views/domain_50/view_05950.view.lkml"
include: "/views/domain_02/view_05952.view.lkml"
include: "/views/domain_03/view_05953.view.lkml"
include: "/views/domain_04/view_05954.view.lkml"

explore: explore_1983 {
  label: "Explore Explore 1983"
  description: "Comprehensive analytics explore joining base view_05950 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_05950
  
  always_filter: {
    filters: [view_05950.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05950.created_at_date: "7 days"]
    unless: [view_05950.id, view_05950.status]
  }

  join: view_05952 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05950.user_id} = ${view_05952.id} ;;
    required_joins: []
  }

  join: view_05953 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05950.account_id} = ${view_05953.account_id} ;;
    required_joins: [view_05952]
  }

  join: view_05954 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05950.category} = ${view_05954.category} ;;
  }

  access_filter: {
    field: view_05950.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05950.is_deleted} = false ;;
}
