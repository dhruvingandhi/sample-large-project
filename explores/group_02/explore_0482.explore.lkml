# Update for 500 file diff target
# Explore: explore_0482
# Auto-generated LookML Explore File

include: "/views/domain_47/view_01447.view.lkml"
include: "/views/domain_49/view_01449.view.lkml"
include: "/views/domain_50/view_01450.view.lkml"
include: "/views/domain_01/view_01451.view.lkml"

explore: explore_0482 {
  label: "Explore Explore 0482"
  description: "Comprehensive analytics explore joining base view_01447 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_01447
  
  always_filter: {
    filters: [view_01447.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01447.created_at_date: "7 days"]
    unless: [view_01447.id, view_01447.status]
  }

  join: view_01449 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01447.user_id} = ${view_01449.id} ;;
    required_joins: []
  }

  join: view_01450 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01447.account_id} = ${view_01450.account_id} ;;
    required_joins: [view_01449]
  }

  join: view_01451 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01447.category} = ${view_01451.category} ;;
  }

  access_filter: {
    field: view_01447.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01447.is_deleted} = false ;;
}
