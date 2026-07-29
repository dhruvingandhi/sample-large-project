# Explore: explore_1287
# Auto-generated LookML Explore File

include: "/views/domain_12/view_03862.view.lkml"
include: "/views/domain_14/view_03864.view.lkml"
include: "/views/domain_15/view_03865.view.lkml"
include: "/views/domain_16/view_03866.view.lkml"

explore: explore_1287 {
  label: "Explore Explore 1287"
  description: "Comprehensive analytics explore joining base view_03862 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_03862
  
  always_filter: {
    filters: [view_03862.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03862.created_at_date: "7 days"]
    unless: [view_03862.id, view_03862.status]
  }

  join: view_03864 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03862.user_id} = ${view_03864.id} ;;
    required_joins: []
  }

  join: view_03865 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03862.account_id} = ${view_03865.account_id} ;;
    required_joins: [view_03864]
  }

  join: view_03866 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03862.category} = ${view_03866.category} ;;
  }

  access_filter: {
    field: view_03862.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03862.is_deleted} = false ;;
}
