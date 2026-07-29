# Explore: explore_3009
# Auto-generated LookML Explore File

include: "/views/domain_28/view_09028.view.lkml"
include: "/views/domain_30/view_09030.view.lkml"
include: "/views/domain_31/view_09031.view.lkml"
include: "/views/domain_32/view_09032.view.lkml"

explore: explore_3009 {
  label: "Explore Explore 3009"
  description: "Comprehensive analytics explore joining base view_09028 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_09028
  
  always_filter: {
    filters: [view_09028.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09028.created_at_date: "7 days"]
    unless: [view_09028.id, view_09028.status]
  }

  join: view_09030 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09028.user_id} = ${view_09030.id} ;;
    required_joins: []
  }

  join: view_09031 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09028.account_id} = ${view_09031.account_id} ;;
    required_joins: [view_09030]
  }

  join: view_09032 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09028.category} = ${view_09032.category} ;;
  }

  access_filter: {
    field: view_09028.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09028.is_deleted} = false ;;
}
