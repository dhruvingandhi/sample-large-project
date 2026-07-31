# Update for 2000 file diff target
# Explore: explore_2350
# Auto-generated LookML Explore File

include: "/views/domain_01/view_07051.view.lkml"
include: "/views/domain_03/view_07053.view.lkml"
include: "/views/domain_04/view_07054.view.lkml"
include: "/views/domain_05/view_07055.view.lkml"

explore: explore_2350 {
  label: "Explore Explore 2350"
  description: "Comprehensive analytics explore joining base view_07051 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_07051
  
  always_filter: {
    filters: [view_07051.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07051.created_at_date: "7 days"]
    unless: [view_07051.id, view_07051.status]
  }

  join: view_07053 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07051.user_id} = ${view_07053.id} ;;
    required_joins: []
  }

  join: view_07054 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07051.account_id} = ${view_07054.account_id} ;;
    required_joins: [view_07053]
  }

  join: view_07055 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07051.category} = ${view_07055.category} ;;
  }

  access_filter: {
    field: view_07051.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07051.is_deleted} = false ;;
}
