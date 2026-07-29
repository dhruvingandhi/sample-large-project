# Explore: explore_3524
# Auto-generated LookML Explore File

include: "/views/domain_23/view_10573.view.lkml"
include: "/views/domain_25/view_10575.view.lkml"
include: "/views/domain_26/view_10576.view.lkml"
include: "/views/domain_27/view_10577.view.lkml"

explore: explore_3524 {
  label: "Explore Explore 3524"
  description: "Comprehensive analytics explore joining base view_10573 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_10573
  
  always_filter: {
    filters: [view_10573.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10573.created_at_date: "7 days"]
    unless: [view_10573.id, view_10573.status]
  }

  join: view_10575 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10573.user_id} = ${view_10575.id} ;;
    required_joins: []
  }

  join: view_10576 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10573.account_id} = ${view_10576.account_id} ;;
    required_joins: [view_10575]
  }

  join: view_10577 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10573.category} = ${view_10577.category} ;;
  }

  access_filter: {
    field: view_10573.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10573.is_deleted} = false ;;
}
