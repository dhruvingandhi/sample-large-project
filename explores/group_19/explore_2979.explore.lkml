# Update for 2000 file diff target
# Explore: explore_2979
# Auto-generated LookML Explore File

include: "/views/domain_38/view_08938.view.lkml"
include: "/views/domain_40/view_08940.view.lkml"
include: "/views/domain_41/view_08941.view.lkml"
include: "/views/domain_42/view_08942.view.lkml"

explore: explore_2979 {
  label: "Explore Explore 2979"
  description: "Comprehensive analytics explore joining base view_08938 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_08938
  
  always_filter: {
    filters: [view_08938.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08938.created_at_date: "7 days"]
    unless: [view_08938.id, view_08938.status]
  }

  join: view_08940 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08938.user_id} = ${view_08940.id} ;;
    required_joins: []
  }

  join: view_08941 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08938.account_id} = ${view_08941.account_id} ;;
    required_joins: [view_08940]
  }

  join: view_08942 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08938.category} = ${view_08942.category} ;;
  }

  access_filter: {
    field: view_08938.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08938.is_deleted} = false ;;
}
