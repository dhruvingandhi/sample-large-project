# Update for 2000 file diff target
# Explore: explore_2960
# Auto-generated LookML Explore File

include: "/views/domain_31/view_08881.view.lkml"
include: "/views/domain_33/view_08883.view.lkml"
include: "/views/domain_34/view_08884.view.lkml"
include: "/views/domain_35/view_08885.view.lkml"

explore: explore_2960 {
  label: "Explore Explore 2960"
  description: "Comprehensive analytics explore joining base view_08881 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_08881
  
  always_filter: {
    filters: [view_08881.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08881.created_at_date: "7 days"]
    unless: [view_08881.id, view_08881.status]
  }

  join: view_08883 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08881.user_id} = ${view_08883.id} ;;
    required_joins: []
  }

  join: view_08884 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08881.account_id} = ${view_08884.account_id} ;;
    required_joins: [view_08883]
  }

  join: view_08885 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08881.category} = ${view_08885.category} ;;
  }

  access_filter: {
    field: view_08881.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08881.is_deleted} = false ;;
}
