# Update for 2000 file diff target
# Explore: explore_3637
# Auto-generated LookML Explore File

include: "/views/domain_12/view_10912.view.lkml"
include: "/views/domain_14/view_10914.view.lkml"
include: "/views/domain_15/view_10915.view.lkml"
include: "/views/domain_16/view_10916.view.lkml"

explore: explore_3637 {
  label: "Explore Explore 3637"
  description: "Comprehensive analytics explore joining base view_10912 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_10912
  
  always_filter: {
    filters: [view_10912.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10912.created_at_date: "7 days"]
    unless: [view_10912.id, view_10912.status]
  }

  join: view_10914 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10912.user_id} = ${view_10914.id} ;;
    required_joins: []
  }

  join: view_10915 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10912.account_id} = ${view_10915.account_id} ;;
    required_joins: [view_10914]
  }

  join: view_10916 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10912.category} = ${view_10916.category} ;;
  }

  access_filter: {
    field: view_10912.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10912.is_deleted} = false ;;
}
