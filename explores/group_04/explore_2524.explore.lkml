# Explore: explore_2524
# Auto-generated LookML Explore File

include: "/views/domain_23/view_07573.view.lkml"
include: "/views/domain_25/view_07575.view.lkml"
include: "/views/domain_26/view_07576.view.lkml"
include: "/views/domain_27/view_07577.view.lkml"

explore: explore_2524 {
  label: "Explore Explore 2524"
  description: "Comprehensive analytics explore joining base view_07573 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_07573
  
  always_filter: {
    filters: [view_07573.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07573.created_at_date: "7 days"]
    unless: [view_07573.id, view_07573.status]
  }

  join: view_07575 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07573.user_id} = ${view_07575.id} ;;
    required_joins: []
  }

  join: view_07576 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07573.account_id} = ${view_07576.account_id} ;;
    required_joins: [view_07575]
  }

  join: view_07577 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07573.category} = ${view_07577.category} ;;
  }

  access_filter: {
    field: view_07573.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07573.is_deleted} = false ;;
}
