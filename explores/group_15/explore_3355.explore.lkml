# Explore: explore_3355
# Auto-generated LookML Explore File

include: "/views/domain_16/view_10066.view.lkml"
include: "/views/domain_18/view_10068.view.lkml"
include: "/views/domain_19/view_10069.view.lkml"
include: "/views/domain_20/view_10070.view.lkml"

explore: explore_3355 {
  label: "Explore Explore 3355"
  description: "Comprehensive analytics explore joining base view_10066 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_10066
  
  always_filter: {
    filters: [view_10066.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10066.created_at_date: "7 days"]
    unless: [view_10066.id, view_10066.status]
  }

  join: view_10068 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10066.user_id} = ${view_10068.id} ;;
    required_joins: []
  }

  join: view_10069 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10066.account_id} = ${view_10069.account_id} ;;
    required_joins: [view_10068]
  }

  join: view_10070 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10066.category} = ${view_10070.category} ;;
  }

  access_filter: {
    field: view_10066.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10066.is_deleted} = false ;;
}
