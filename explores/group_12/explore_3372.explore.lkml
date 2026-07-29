# Explore: explore_3372
# Auto-generated LookML Explore File

include: "/views/domain_17/view_10117.view.lkml"
include: "/views/domain_19/view_10119.view.lkml"
include: "/views/domain_20/view_10120.view.lkml"
include: "/views/domain_21/view_10121.view.lkml"

explore: explore_3372 {
  label: "Explore Explore 3372"
  description: "Comprehensive analytics explore joining base view_10117 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_10117
  
  always_filter: {
    filters: [view_10117.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10117.created_at_date: "7 days"]
    unless: [view_10117.id, view_10117.status]
  }

  join: view_10119 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10117.user_id} = ${view_10119.id} ;;
    required_joins: []
  }

  join: view_10120 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10117.account_id} = ${view_10120.account_id} ;;
    required_joins: [view_10119]
  }

  join: view_10121 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10117.category} = ${view_10121.category} ;;
  }

  access_filter: {
    field: view_10117.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10117.is_deleted} = false ;;
}
