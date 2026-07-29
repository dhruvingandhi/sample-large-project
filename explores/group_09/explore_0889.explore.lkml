# Explore: explore_0889
# Auto-generated LookML Explore File

include: "/views/domain_18/view_02668.view.lkml"
include: "/views/domain_20/view_02670.view.lkml"
include: "/views/domain_21/view_02671.view.lkml"
include: "/views/domain_22/view_02672.view.lkml"

explore: explore_0889 {
  label: "Explore Explore 0889"
  description: "Comprehensive analytics explore joining base view_02668 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_02668
  
  always_filter: {
    filters: [view_02668.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02668.created_at_date: "7 days"]
    unless: [view_02668.id, view_02668.status]
  }

  join: view_02670 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02668.user_id} = ${view_02670.id} ;;
    required_joins: []
  }

  join: view_02671 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02668.account_id} = ${view_02671.account_id} ;;
    required_joins: [view_02670]
  }

  join: view_02672 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02668.category} = ${view_02672.category} ;;
  }

  access_filter: {
    field: view_02668.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02668.is_deleted} = false ;;
}
