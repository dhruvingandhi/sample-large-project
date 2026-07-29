# Explore: explore_3420
# Auto-generated LookML Explore File

include: "/views/domain_11/view_10261.view.lkml"
include: "/views/domain_13/view_10263.view.lkml"
include: "/views/domain_14/view_10264.view.lkml"
include: "/views/domain_15/view_10265.view.lkml"

explore: explore_3420 {
  label: "Explore Explore 3420"
  description: "Comprehensive analytics explore joining base view_10261 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_10261
  
  always_filter: {
    filters: [view_10261.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10261.created_at_date: "7 days"]
    unless: [view_10261.id, view_10261.status]
  }

  join: view_10263 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10261.user_id} = ${view_10263.id} ;;
    required_joins: []
  }

  join: view_10264 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10261.account_id} = ${view_10264.account_id} ;;
    required_joins: [view_10263]
  }

  join: view_10265 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10261.category} = ${view_10265.category} ;;
  }

  access_filter: {
    field: view_10261.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10261.is_deleted} = false ;;
}
