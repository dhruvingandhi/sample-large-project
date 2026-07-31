# Antigravity modified: branch dg-3
# Explore: explore_0625
# Auto-generated LookML Explore File

include: "/views/domain_26/view_01876.view.lkml"
include: "/views/domain_28/view_01878.view.lkml"
include: "/views/domain_29/view_01879.view.lkml"
include: "/views/domain_30/view_01880.view.lkml"

explore: explore_0625 {
  label: "Explore Explore 0625"
  description: "Comprehensive analytics explore joining base view_01876 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_01876
  
  always_filter: {
    filters: [view_01876.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01876.created_at_date: "7 days"]
    unless: [view_01876.id, view_01876.status]
  }

  join: view_01878 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01876.user_id} = ${view_01878.id} ;;
    required_joins: []
  }

  join: view_01879 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01876.account_id} = ${view_01879.account_id} ;;
    required_joins: [view_01878]
  }

  join: view_01880 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01876.category} = ${view_01880.category} ;;
  }

  access_filter: {
    field: view_01876.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01876.is_deleted} = false ;;
}
