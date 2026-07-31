# Update for 2000 file diff target
# Explore: explore_0979
# Auto-generated LookML Explore File

include: "/views/domain_38/view_02938.view.lkml"
include: "/views/domain_40/view_02940.view.lkml"
include: "/views/domain_41/view_02941.view.lkml"
include: "/views/domain_42/view_02942.view.lkml"

explore: explore_0979 {
  label: "Explore Explore 0979"
  description: "Comprehensive analytics explore joining base view_02938 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_02938
  
  always_filter: {
    filters: [view_02938.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02938.created_at_date: "7 days"]
    unless: [view_02938.id, view_02938.status]
  }

  join: view_02940 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02938.user_id} = ${view_02940.id} ;;
    required_joins: []
  }

  join: view_02941 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02938.account_id} = ${view_02941.account_id} ;;
    required_joins: [view_02940]
  }

  join: view_02942 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02938.category} = ${view_02942.category} ;;
  }

  access_filter: {
    field: view_02938.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02938.is_deleted} = false ;;
}
