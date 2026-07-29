# Explore: explore_2289
# Auto-generated LookML Explore File

include: "/views/domain_18/view_06868.view.lkml"
include: "/views/domain_20/view_06870.view.lkml"
include: "/views/domain_21/view_06871.view.lkml"
include: "/views/domain_22/view_06872.view.lkml"

explore: explore_2289 {
  label: "Explore Explore 2289"
  description: "Comprehensive analytics explore joining base view_06868 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_06868
  
  always_filter: {
    filters: [view_06868.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06868.created_at_date: "7 days"]
    unless: [view_06868.id, view_06868.status]
  }

  join: view_06870 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06868.user_id} = ${view_06870.id} ;;
    required_joins: []
  }

  join: view_06871 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06868.account_id} = ${view_06871.account_id} ;;
    required_joins: [view_06870]
  }

  join: view_06872 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06868.category} = ${view_06872.category} ;;
  }

  access_filter: {
    field: view_06868.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06868.is_deleted} = false ;;
}
