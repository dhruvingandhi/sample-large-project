# Explore: explore_1848
# Auto-generated LookML Explore File

include: "/views/domain_45/view_05545.view.lkml"
include: "/views/domain_47/view_05547.view.lkml"
include: "/views/domain_48/view_05548.view.lkml"
include: "/views/domain_49/view_05549.view.lkml"

explore: explore_1848 {
  label: "Explore Explore 1848"
  description: "Comprehensive analytics explore joining base view_05545 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_05545
  
  always_filter: {
    filters: [view_05545.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05545.created_at_date: "7 days"]
    unless: [view_05545.id, view_05545.status]
  }

  join: view_05547 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05545.user_id} = ${view_05547.id} ;;
    required_joins: []
  }

  join: view_05548 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05545.account_id} = ${view_05548.account_id} ;;
    required_joins: [view_05547]
  }

  join: view_05549 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05545.category} = ${view_05549.category} ;;
  }

  access_filter: {
    field: view_05545.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05545.is_deleted} = false ;;
}
