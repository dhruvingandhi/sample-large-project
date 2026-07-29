# Explore: explore_1805
# Auto-generated LookML Explore File

include: "/views/domain_16/view_05416.view.lkml"
include: "/views/domain_18/view_05418.view.lkml"
include: "/views/domain_19/view_05419.view.lkml"
include: "/views/domain_20/view_05420.view.lkml"

explore: explore_1805 {
  label: "Explore Explore 1805"
  description: "Comprehensive analytics explore joining base view_05416 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_05416
  
  always_filter: {
    filters: [view_05416.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05416.created_at_date: "7 days"]
    unless: [view_05416.id, view_05416.status]
  }

  join: view_05418 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05416.user_id} = ${view_05418.id} ;;
    required_joins: []
  }

  join: view_05419 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05416.account_id} = ${view_05419.account_id} ;;
    required_joins: [view_05418]
  }

  join: view_05420 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05416.category} = ${view_05420.category} ;;
  }

  access_filter: {
    field: view_05416.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05416.is_deleted} = false ;;
}
