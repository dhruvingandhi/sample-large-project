# Explore: explore_1772
# Auto-generated LookML Explore File

include: "/views/domain_17/view_05317.view.lkml"
include: "/views/domain_19/view_05319.view.lkml"
include: "/views/domain_20/view_05320.view.lkml"
include: "/views/domain_21/view_05321.view.lkml"

explore: explore_1772 {
  label: "Explore Explore 1772"
  description: "Comprehensive analytics explore joining base view_05317 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_05317
  
  always_filter: {
    filters: [view_05317.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05317.created_at_date: "7 days"]
    unless: [view_05317.id, view_05317.status]
  }

  join: view_05319 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05317.user_id} = ${view_05319.id} ;;
    required_joins: []
  }

  join: view_05320 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05317.account_id} = ${view_05320.account_id} ;;
    required_joins: [view_05319]
  }

  join: view_05321 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05317.category} = ${view_05321.category} ;;
  }

  access_filter: {
    field: view_05317.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05317.is_deleted} = false ;;
}
