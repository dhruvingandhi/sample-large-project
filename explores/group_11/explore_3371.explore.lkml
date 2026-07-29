# Explore: explore_3371
# Auto-generated LookML Explore File

include: "/views/domain_14/view_10114.view.lkml"
include: "/views/domain_16/view_10116.view.lkml"
include: "/views/domain_17/view_10117.view.lkml"
include: "/views/domain_18/view_10118.view.lkml"

explore: explore_3371 {
  label: "Explore Explore 3371"
  description: "Comprehensive analytics explore joining base view_10114 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_10114
  
  always_filter: {
    filters: [view_10114.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10114.created_at_date: "7 days"]
    unless: [view_10114.id, view_10114.status]
  }

  join: view_10116 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10114.user_id} = ${view_10116.id} ;;
    required_joins: []
  }

  join: view_10117 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10114.account_id} = ${view_10117.account_id} ;;
    required_joins: [view_10116]
  }

  join: view_10118 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10114.category} = ${view_10118.category} ;;
  }

  access_filter: {
    field: view_10114.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10114.is_deleted} = false ;;
}
