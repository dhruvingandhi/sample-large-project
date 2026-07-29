# Explore: explore_3384
# Auto-generated LookML Explore File

include: "/views/domain_03/view_10153.view.lkml"
include: "/views/domain_05/view_10155.view.lkml"
include: "/views/domain_06/view_10156.view.lkml"
include: "/views/domain_07/view_10157.view.lkml"

explore: explore_3384 {
  label: "Explore Explore 3384"
  description: "Comprehensive analytics explore joining base view_10153 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_10153
  
  always_filter: {
    filters: [view_10153.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10153.created_at_date: "7 days"]
    unless: [view_10153.id, view_10153.status]
  }

  join: view_10155 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10153.user_id} = ${view_10155.id} ;;
    required_joins: []
  }

  join: view_10156 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10153.account_id} = ${view_10156.account_id} ;;
    required_joins: [view_10155]
  }

  join: view_10157 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10153.category} = ${view_10157.category} ;;
  }

  access_filter: {
    field: view_10153.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10153.is_deleted} = false ;;
}
