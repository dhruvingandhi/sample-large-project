# Explore: explore_3983
# Auto-generated LookML Explore File

include: "/views/domain_50/view_11950.view.lkml"
include: "/views/domain_02/view_11952.view.lkml"
include: "/views/domain_03/view_11953.view.lkml"
include: "/views/domain_04/view_11954.view.lkml"

explore: explore_3983 {
  label: "Explore Explore 3983"
  description: "Comprehensive analytics explore joining base view_11950 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_11950
  
  always_filter: {
    filters: [view_11950.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11950.created_at_date: "7 days"]
    unless: [view_11950.id, view_11950.status]
  }

  join: view_11952 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11950.user_id} = ${view_11952.id} ;;
    required_joins: []
  }

  join: view_11953 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11950.account_id} = ${view_11953.account_id} ;;
    required_joins: [view_11952]
  }

  join: view_11954 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11950.category} = ${view_11954.category} ;;
  }

  access_filter: {
    field: view_11950.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11950.is_deleted} = false ;;
}
