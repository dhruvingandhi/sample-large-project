# Explore: explore_3595
# Auto-generated LookML Explore File

include: "/views/domain_36/view_10786.view.lkml"
include: "/views/domain_38/view_10788.view.lkml"
include: "/views/domain_39/view_10789.view.lkml"
include: "/views/domain_40/view_10790.view.lkml"

explore: explore_3595 {
  label: "Explore Explore 3595"
  description: "Comprehensive analytics explore joining base view_10786 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_10786
  
  always_filter: {
    filters: [view_10786.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10786.created_at_date: "7 days"]
    unless: [view_10786.id, view_10786.status]
  }

  join: view_10788 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10786.user_id} = ${view_10788.id} ;;
    required_joins: []
  }

  join: view_10789 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10786.account_id} = ${view_10789.account_id} ;;
    required_joins: [view_10788]
  }

  join: view_10790 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10786.category} = ${view_10790.category} ;;
  }

  access_filter: {
    field: view_10786.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10786.is_deleted} = false ;;
}
