# Explore: explore_1869
# Auto-generated LookML Explore File

include: "/views/domain_08/view_05608.view.lkml"
include: "/views/domain_10/view_05610.view.lkml"
include: "/views/domain_11/view_05611.view.lkml"
include: "/views/domain_12/view_05612.view.lkml"

explore: explore_1869 {
  label: "Explore Explore 1869"
  description: "Comprehensive analytics explore joining base view_05608 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_05608
  
  always_filter: {
    filters: [view_05608.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05608.created_at_date: "7 days"]
    unless: [view_05608.id, view_05608.status]
  }

  join: view_05610 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05608.user_id} = ${view_05610.id} ;;
    required_joins: []
  }

  join: view_05611 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05608.account_id} = ${view_05611.account_id} ;;
    required_joins: [view_05610]
  }

  join: view_05612 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05608.category} = ${view_05612.category} ;;
  }

  access_filter: {
    field: view_05608.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05608.is_deleted} = false ;;
}
