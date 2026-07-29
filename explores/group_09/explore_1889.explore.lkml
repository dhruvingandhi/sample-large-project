# Explore: explore_1889
# Auto-generated LookML Explore File

include: "/views/domain_18/view_05668.view.lkml"
include: "/views/domain_20/view_05670.view.lkml"
include: "/views/domain_21/view_05671.view.lkml"
include: "/views/domain_22/view_05672.view.lkml"

explore: explore_1889 {
  label: "Explore Explore 1889"
  description: "Comprehensive analytics explore joining base view_05668 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_05668
  
  always_filter: {
    filters: [view_05668.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05668.created_at_date: "7 days"]
    unless: [view_05668.id, view_05668.status]
  }

  join: view_05670 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05668.user_id} = ${view_05670.id} ;;
    required_joins: []
  }

  join: view_05671 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05668.account_id} = ${view_05671.account_id} ;;
    required_joins: [view_05670]
  }

  join: view_05672 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05668.category} = ${view_05672.category} ;;
  }

  access_filter: {
    field: view_05668.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05668.is_deleted} = false ;;
}
