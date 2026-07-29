# Explore: explore_3295
# Auto-generated LookML Explore File

include: "/views/domain_36/view_09886.view.lkml"
include: "/views/domain_38/view_09888.view.lkml"
include: "/views/domain_39/view_09889.view.lkml"
include: "/views/domain_40/view_09890.view.lkml"

explore: explore_3295 {
  label: "Explore Explore 3295"
  description: "Comprehensive analytics explore joining base view_09886 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_09886
  
  always_filter: {
    filters: [view_09886.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09886.created_at_date: "7 days"]
    unless: [view_09886.id, view_09886.status]
  }

  join: view_09888 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09886.user_id} = ${view_09888.id} ;;
    required_joins: []
  }

  join: view_09889 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09886.account_id} = ${view_09889.account_id} ;;
    required_joins: [view_09888]
  }

  join: view_09890 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09886.category} = ${view_09890.category} ;;
  }

  access_filter: {
    field: view_09886.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09886.is_deleted} = false ;;
}
