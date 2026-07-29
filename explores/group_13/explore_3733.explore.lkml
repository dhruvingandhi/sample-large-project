# Explore: explore_3733
# Auto-generated LookML Explore File

include: "/views/domain_50/view_11200.view.lkml"
include: "/views/domain_02/view_11202.view.lkml"
include: "/views/domain_03/view_11203.view.lkml"
include: "/views/domain_04/view_11204.view.lkml"

explore: explore_3733 {
  label: "Explore Explore 3733"
  description: "Comprehensive analytics explore joining base view_11200 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_11200
  
  always_filter: {
    filters: [view_11200.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11200.created_at_date: "7 days"]
    unless: [view_11200.id, view_11200.status]
  }

  join: view_11202 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11200.user_id} = ${view_11202.id} ;;
    required_joins: []
  }

  join: view_11203 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11200.account_id} = ${view_11203.account_id} ;;
    required_joins: [view_11202]
  }

  join: view_11204 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11200.category} = ${view_11204.category} ;;
  }

  access_filter: {
    field: view_11200.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11200.is_deleted} = false ;;
}
