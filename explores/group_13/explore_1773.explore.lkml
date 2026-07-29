# Explore: explore_1773
# Auto-generated LookML Explore File

include: "/views/domain_20/view_05320.view.lkml"
include: "/views/domain_22/view_05322.view.lkml"
include: "/views/domain_23/view_05323.view.lkml"
include: "/views/domain_24/view_05324.view.lkml"

explore: explore_1773 {
  label: "Explore Explore 1773"
  description: "Comprehensive analytics explore joining base view_05320 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_05320
  
  always_filter: {
    filters: [view_05320.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05320.created_at_date: "7 days"]
    unless: [view_05320.id, view_05320.status]
  }

  join: view_05322 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05320.user_id} = ${view_05322.id} ;;
    required_joins: []
  }

  join: view_05323 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05320.account_id} = ${view_05323.account_id} ;;
    required_joins: [view_05322]
  }

  join: view_05324 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05320.category} = ${view_05324.category} ;;
  }

  access_filter: {
    field: view_05320.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05320.is_deleted} = false ;;
}
