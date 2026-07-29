# Explore: explore_2595
# Auto-generated LookML Explore File

include: "/views/domain_36/view_07786.view.lkml"
include: "/views/domain_38/view_07788.view.lkml"
include: "/views/domain_39/view_07789.view.lkml"
include: "/views/domain_40/view_07790.view.lkml"

explore: explore_2595 {
  label: "Explore Explore 2595"
  description: "Comprehensive analytics explore joining base view_07786 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_07786
  
  always_filter: {
    filters: [view_07786.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07786.created_at_date: "7 days"]
    unless: [view_07786.id, view_07786.status]
  }

  join: view_07788 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07786.user_id} = ${view_07788.id} ;;
    required_joins: []
  }

  join: view_07789 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07786.account_id} = ${view_07789.account_id} ;;
    required_joins: [view_07788]
  }

  join: view_07790 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07786.category} = ${view_07790.category} ;;
  }

  access_filter: {
    field: view_07786.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07786.is_deleted} = false ;;
}
