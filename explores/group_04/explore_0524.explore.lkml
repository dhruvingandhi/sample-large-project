# Explore: explore_0524
# Auto-generated LookML Explore File

include: "/views/domain_23/view_01573.view.lkml"
include: "/views/domain_25/view_01575.view.lkml"
include: "/views/domain_26/view_01576.view.lkml"
include: "/views/domain_27/view_01577.view.lkml"

explore: explore_0524 {
  label: "Explore Explore 0524"
  description: "Comprehensive analytics explore joining base view_01573 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_01573
  
  always_filter: {
    filters: [view_01573.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01573.created_at_date: "7 days"]
    unless: [view_01573.id, view_01573.status]
  }

  join: view_01575 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01573.user_id} = ${view_01575.id} ;;
    required_joins: []
  }

  join: view_01576 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01573.account_id} = ${view_01576.account_id} ;;
    required_joins: [view_01575]
  }

  join: view_01577 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01573.category} = ${view_01577.category} ;;
  }

  access_filter: {
    field: view_01573.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01573.is_deleted} = false ;;
}
