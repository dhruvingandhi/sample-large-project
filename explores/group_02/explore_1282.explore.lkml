# Update for 500 file diff target
# Explore: explore_1282
# Auto-generated LookML Explore File

include: "/views/domain_47/view_03847.view.lkml"
include: "/views/domain_49/view_03849.view.lkml"
include: "/views/domain_50/view_03850.view.lkml"
include: "/views/domain_01/view_03851.view.lkml"

explore: explore_1282 {
  label: "Explore Explore 1282"
  description: "Comprehensive analytics explore joining base view_03847 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_03847
  
  always_filter: {
    filters: [view_03847.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03847.created_at_date: "7 days"]
    unless: [view_03847.id, view_03847.status]
  }

  join: view_03849 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03847.user_id} = ${view_03849.id} ;;
    required_joins: []
  }

  join: view_03850 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03847.account_id} = ${view_03850.account_id} ;;
    required_joins: [view_03849]
  }

  join: view_03851 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03847.category} = ${view_03851.category} ;;
  }

  access_filter: {
    field: view_03847.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03847.is_deleted} = false ;;
}
